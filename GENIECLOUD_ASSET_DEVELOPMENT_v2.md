# GenieCloud Asset Development - Master Specification

**Version:** 2.0  
**Created:** 12/28/2025  
**Author:** Steve Hundley / Cursor AI  
**Last Updated:** 12/28/2025  
**Status:** CONSOLIDATED - Single Source of Truth for GenieCloud Development

---

## TABLE OF CONTENTS

1. [Executive Summary](#1-executive-summary)
2. [System Architecture](#2-system-architecture)
3. [Theme System](#3-theme-system)
4. [XSL Template Development](#4-xsl-template-development)
5. [Asset Templates Reference](#5-asset-templates-reference)
6. [Local Development Environment](#6-local-development-environment)
7. [QA & Debugging](#7-qa--debugging)
8. [Production Deployment](#8-production-deployment)
9. [**Collection Editor & CTA Integration**](#9-collection-editor--cta-integration) ⭐ NEW
10. [Enhancement Wishlist](#10-enhancement-wishlist)
11. [Change Log](#11-change-log)

---

## 1. EXECUTIVE SUMMARY

GenieCloud is TheGenie.ai's **XSL-based asset rendering engine** that generates marketing materials from XML data. It produces:

- **Social Media Graphics** (1080x1080 Instagram, Facebook, LinkedIn)
- **Direct Mail** (Postcards 4x6, 5x7, Flyers)
- **Landing Pages** (PLS Hollywood, LC Hollywood, etc.)
- **PDF Brochures** and Reports
- **Market Insider Reports**

### Key Technologies

| Component | Technology |
|-----------|------------|
| Transform Engine | SaxonJS (XSLT 3.0) |
| Rendering | Puppeteer (HTML → PNG/PDF) |
| Storage | AWS S3 (genie-cloud bucket) |
| CDN | CloudFlare |
| Themes | CSS Variables |

---

## 2. SYSTEM ARCHITECTURE

### 2.1 Render Pipeline

```
[XML Data Source]
      │
      ▼
[GenieCloud Processor]
      │
      ├──► JSON → XML conversion
      │
      ▼
[XSL Template]
      │
      ├──► Imports common.xsl, global-variables.xsl
      │
      ▼
[SaxonJS Transform]
      │
      ├──► Generates HTML with embedded SVG
      │
      ▼
[Theme CSS Applied]
      │
      ├──► @import url(themes/{theme}.css)
      │
      ▼
[Puppeteer Render]
      │
      ├──► HTML → PNG/PDF
      │
      ▼
[S3 Upload]
      │
      ├──► cloud.thegenie.ai/_assets/...
      │
      ▼
[Collection Page]
```

### 2.2 Key Directories (Local Development)

```
D:\Cursor\_SourceCode\stage.geniecloud\
├── public/
│   └── _assets/
│       ├── _xsl/                    # XSL Templates
│       │   ├── landing-pages/       # Landing page templates
│       │   ├── social-marketing-graphics/  # Social ads
│       │   ├── mailers/            # Postcards, flyers
│       │   └── reports/            # Market reports
│       ├── _xsl_imports/           # Shared XSL components
│       │   ├── common.xsl          # Base template
│       │   ├── global-variables.xsl # All variables
│       │   └── genie-functions.xsl # Helper functions
│       ├── themes/                 # CSS theme files
│       │   ├── compass.css
│       │   ├── apple-black.css
│       │   └── inspired-re.css
│       └── _reference/             # Sample XML files
├── genie-processor/                # Local XSLT processor
│   ├── src/index.js               # Main processor
│   └── xml/                        # XML data files
└── rendered_*/                     # Output directories
```

### 2.3 Production URLs

| Resource | URL |
|----------|-----|
| Asset CDN | `https://cloud.thegenie.ai/` |
| API | `https://cloud-api.thegenie.ai/` |
| Theme CSS | `https://cloud.thegenie.ai/_assets/themes/{theme}.css` |
| Collections | `https://cloud.thegenie.ai/genie-collection/{id}` |

---

## 3. THEME SYSTEM

### 3.1 Theme vs Template - CRITICAL DISTINCTION

| Aspect | THEME | TEMPLATE |
|--------|-------|----------|
| **What it is** | Configuration/Settings | Development/Code |
| **Contains** | Colors, fonts, hex values | HTML structure, layout, logic |
| **File type** | `.css` (CSS variables) | `.xsl`, `.html`, `.css` (layout) |
| **Who manages** | Admins, Brand Managers | Developers |
| **Impact of change** | Visual styling only | Layout, structure, functionality |
| **Risk level** | Low (just colors) | High (can break pages) |

> **Golden Rule:** Never modify a working template. Clone it first.
> Theme changes are safe. Template changes require new versions.

### 3.2 How Themes Work

```
XML: theme="compass" themeHue="dark"
         │
         ▼
XSL svg-wrapper template:
  <style>@import url({siteUrl}_assets/themes/{theme}.css);</style>
  <body class="{size} {theme} {themeHue}">
         │
         ▼
CSS: .compass.dark { --theme-body-background: #1a1a1a; ... }
```

### 3.3 CSS Variable Reference

| Variable | Purpose | Example (Dark) |
|----------|---------|----------------|
| `--theme-body-background` | Page backgrounds | `#000000` |
| `--theme-heading-color` | H1, H2 headings | `#f5f5f7` |
| `--theme-sub-heading-color` | Subtitles | `#86868b` |
| `--theme-body-color` | Paragraph text | `#f5f5f7` |
| `--theme-emphasis-color` | CTAs, accents | `#2997ff` |
| `--theme-body-font` | Body font stack | `-apple-system, ...` |
| `--theme-heading-font` | Heading font stack | `-apple-system, ...` |

### 3.4 Available Themes

| Theme | File | Best For |
|-------|------|----------|
| Compass | `compass.css` | Compass brokerage agents |
| Apple Black | `apple-black.css` | Modern, Apple-inspired |
| Inspired RE | `inspired-re.css` | Inspired Real Estate branding |

### 3.5 Theme + Hue Paradox

**IMPORTANT:** The `themeHue` works counterintuitively for social ads:

| Desired Visual | Set `themeHue` to |
|----------------|-------------------|
| **Dark headers** (social ads) | `light` |
| **Light headers** (landing pages) | `dark` |

This is because XSL templates use `--theme-body-color` for header backgrounds.

### 3.6 Creating a New Theme

#### Step 1: Create CSS File

```css
/* themes/new-theme.css */
.new-theme.light, .new-theme .light {
    --theme-body-background: #ffffff;
    --theme-heading-color: #1d1d1f;
    --theme-emphasis-color: #0071e3;
    --theme-body-font: -apple-system, sans-serif;
}

.new-theme.dark, .new-theme .dark {
    --theme-body-background: #000000;
    --theme-heading-color: #f5f5f7;
    --theme-emphasis-color: #2997ff;
}
```

#### Step 2: Upload to S3

```python
import boto3
session = boto3.Session(profile_name='genie-hub-active')
s3 = session.client('s3', region_name='us-west-1')
s3.put_object(
    Bucket='genie-cloud',
    Key='_assets/themes/new-theme.css',
    Body=css_content,
    ContentType='text/css'
)
```

#### Step 3: Register in Database

```sql
INSERT INTO FarmGenie.dbo.HubTheme 
(ThemeDisplayName, SelectValueReadable, IsDark, IsEnabled, ParamTheme, ParamHue, CreateDate)
VALUES ('New Theme Dark', 'New Theme Dark', 1, 1, 'new-theme', 'dark', GETDATE());
```

#### Step 4: Set Availability (Optional)

```sql
INSERT INTO FarmGenie.dbo.HubThemeAvailability 
(HubThemeId, AspNetUserId, CreateDate)
VALUES (@ThemeId, 'user-guid-here', GETDATE());
```

---

## 4. XSL TEMPLATE DEVELOPMENT

### 4.1 Template Structure

```xml
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <!-- Import shared components -->
    <xsl:import href="common.xsl" />
    
    <!-- Main template -->
    <xsl:template name="svg-body">
        <!-- Background image -->
        <image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
            <xsl:call-template name="switch-image">
                <xsl:with-param name="idx" select="1" />
            </xsl:call-template>
        </image>
        
        <!-- Header bar -->
        <rect fill="var(--theme-body-color)" x="0" y="0" width="100%" height="20%" />
        
        <!-- Text content -->
        <text class="upper center" font-size="46" fill="var(--theme-body-background)">
            <xsl:value-of select="$status-caption" />
        </text>
        
        <!-- Logo -->
        <image class="center" x="0%" y="64%" width="100%" height="20%" 
               preserveAspectRatio="xMidYMid meet">
            <xsl:attribute name="href">
                <xsl:value-of select="$companyLogo" />
            </xsl:attribute>
        </image>
    </xsl:template>
    
</xsl:stylesheet>
```

### 4.2 Key XSL Concepts

#### Variables

```xml
<xsl:variable name="status-caption">
    <xsl:choose>
        <xsl:when test="number(//single/statusTypeID)=1">For Sale</xsl:when>
        <xsl:when test="number(//single/statusTypeID)=6">Private Listing</xsl:when>
        <xsl:otherwise>Expired</xsl:otherwise>
    </xsl:choose>
</xsl:variable>
```

#### Conditionals

```xml
<xsl:choose>
    <xsl:when test="condition1">Result 1</xsl:when>
    <xsl:when test="condition2">Result 2</xsl:when>
    <xsl:otherwise>Default</xsl:otherwise>
</xsl:choose>
```

#### XPath Expressions

| Expression | Meaning |
|------------|---------|
| `//single/price` | Price element |
| `//agent[1]/firstName` | First agent's first name |
| `//output/@theme` | Theme attribute |
| `number(//single/statusTypeID)=6` | Compare to number |

### 4.3 Global Variables (from global-variables.xsl)

| Variable | Purpose |
|----------|---------|
| `$status-caption` | "For Sale", "Private Listing", etc. |
| `$listingStatusCaption` | "Active", "Sold", "Pending" |
| `$listingStatusColor` | Color for status badge |
| `$listingPrice` | Formatted price |
| `$listingAddressLine1` | Street address |
| `$listingAddressLine2` | City, State ZIP |
| `$companyLogo` | Company logo URL |
| `$personalLogo` | Agent personal logo URL |
| `$svgWidth`, `$svgHeight` | Dimensions |

### 4.4 Status Type Handling

| StatusTypeID | Caption | Color |
|--------------|---------|-------|
| 1 | For Sale | `--active-green` |
| 2 | Just Sold | `--sold-red` |
| 3, 4, 12 | In Escrow | `--pending-yellow` |
| **6** | **Private Listing** | `--theme-emphasis-color` |
| 14 | Coming Soon | `--coming-soon-blue` |

**⚠️ CRITICAL:** StatusTypeID=6 was MISSING from production - we added it for PLS.

---

## 5. ASSET TEMPLATES REFERENCE

### 5.1 Social Media Graphics (1080x1080)

| Template | XSL Path | Best For |
|----------|----------|----------|
| Cash Buyers | `social-marketing-graphics/lc-prop-post-03` | "I have a cash buyer" |
| Modern VIP | `social-marketing-graphics/lc-prop-post-01-vip` | Clean modern |
| Simple | `social-marketing-graphics/lc-prop-post-06` | Minimal |
| Just Listed | `social-marketing-graphics/just-listed-01` | Announcements |
| Single Listing 01 | `social-marketing-graphics/single-listing-01` | Property focus |
| Single Listing 03 | `social-marketing-graphics/single-listing-03` | Stats-heavy |

### 5.2 Landing Pages

| Template | XSL Path | Best For |
|----------|----------|----------|
| Hollywood | `landing-pages/lc-hollywood` | Luxury listings |
| PLS Hollywood | `landing-pages/pls-hollywood` | Private/Coming Soon |

### 5.3 Direct Mail

| Template | XSL Path | Size |
|----------|----------|------|
| Whats Trending v1 | `mailers/postcards/whats-trending-v1` | 4x6 |
| Whats Trending v2 | `mailers/postcards/whats-trending-v2` | 5x7 |

### 5.4 Reports

| Template | XSL Path |
|----------|----------|
| Market Insider | `reports/market-insider` |

---

## 6. LOCAL DEVELOPMENT ENVIRONMENT

### 6.1 Starting the Local Processor

```powershell
cd D:\Cursor\_SourceCode\stage.geniecloud\genie-processor
$env:GENIE_URL = "https://cloud.thegenie.ai/"
$env:TEMP_DIR = "D:\Cursor\_SourceCode\stage.geniecloud\public\_assets\_xsl_imports\"
node src/index.js test
```

### 6.2 Rendering an Asset

Open in browser:
```
http://localhost:3000/?xsl=social-marketing-graphics/lc-prop-post-03&xml=pls-10037-rebecca-social-v3
```

### 6.3 XML Data Location

Place XML files in:
```
D:\Cursor\_SourceCode\stage.geniecloud\public\_assets\_reference\
```

### 6.4 Required XML Structure

```xml
<renderRoot>
    <output 
        theme="apple-black" 
        themeHue="light" 
        size="instagram-square"
        userId="{asp-user-id}"
        siteUrl="https://cloud.thegenie.ai/" />
    <agents>
        <agent>
            <firstName>Steve</firstName>
            <lastName>Hundley</lastName>
            <companyLogoLight>https://...</companyLogoLight>
            <companyLogoDark>https://...</companyLogoDark>
        </agent>
    </agents>
    <single>
        <statusTypeID>6</statusTypeID>
        <price>749000</price>
        <bedrooms count="4"/>
        <bathrooms total="3" full="3" half="0"/>
        <address>
            <streetName>Rebecca Place</streetName>
            <city>Boerne</city>
            <state>TX</state>
            <zip>78006</zip>
        </address>
        <images>
            <image src="https://...photo1.jpg"/>
        </images>
    </single>
</renderRoot>
```

---

## 7. QA & DEBUGGING

### 7.1 Common Issues & Fixes

| Issue | Cause | Fix |
|-------|-------|-----|
| "Expired" for Private Listing | StatusTypeID=6 not handled | Add `xsl:when` for ID=6 |
| `Â` character | `&#160;` encoding | Use regular space |
| Wrong theme/colors | CSS not loading | Check `GENIE_URL` env var |
| "PICTURE PENDING" | Wrong XML structure | Use `<images><image src="..."/>` |
| Logo not showing | Wrong logo URL | Check `companyLogoLight/Dark` |

### 7.2 Debugging Checklist

1. ✅ Check XML has correct `theme` and `themeHue`
2. ✅ Check `statusTypeID` value (6=Private, 14=ComingSoon)
3. ✅ Verify CSS @import URLs in rendered HTML
4. ✅ Check body class: `<body class="instagram-square compass dark">`
5. ✅ Verify image URLs are accessible
6. ✅ Check `GENIE_URL` environment variable

### 7.3 Adding Debug Output

```xml
<text x="50%" y="50%" fill="red">
    DEBUG: <xsl:value-of select="$listingStatusCaption"/>
</text>
```

---

## 8. PRODUCTION DEPLOYMENT

### 8.1 Deploying a New Template

1. **Clone existing template** (never modify originals)
2. **Test locally** with genie-processor
3. **Upload to S3:**
   ```
   aws s3 cp template.xsl s3://genie-cloud/_assets/_xsl/{path}/
   ```
4. **Clear CloudFront cache** if needed

### 8.2 Deploying a Theme Change

1. **Edit CSS file** locally
2. **Test** with local processor
3. **Upload:**
   ```
   aws s3 cp theme.css s3://genie-cloud/_assets/themes/
   ```
4. **No database changes** unless adding new theme

### 8.3 S3 Bucket Details

| Bucket | Region | Purpose |
|--------|--------|---------|
| genie-cloud | us-west-1 | Production assets |
| genie-cloud-stage | us-west-1 | Staging/development |

**Note:** There's a legacy bucket `genie-hub-2.s3.eu-west-2.amazonaws.com` - do NOT use.

---

## 9. COLLECTION EDITOR & CTA INTEGRATION

> **NEW in v2.0** - This section documents the Collection Editor tool and CTA system integration.

### 9.1 Collection Editor (Existing Tool)

John has built a standalone Collection Editor that needs integration into the Genie Dashboard.

| Property | Value |
|----------|-------|
| **URL** | [main.d2jn91nws05uwp.amplifyapp.com/collections](https://main.d2jn91nws05uwp.amplifyapp.com/collections) |
| **Tech Stack** | SolidJS + Vite + AWS Amplify |
| **Source Code** | `genie-collection-editor/` |
| **API Endpoint** | AWS Lambda (eu-west-2) |

#### Features
- ✅ List all collections from S3
- ✅ View collection structure (sections, assets)
- ✅ Edit collection metadata
- ✅ View raw JSON
- ✅ Save button (untested)
- 🔴 No authentication
- 🔴 Add Asset picker broken (choices.js not initializing)

#### Deployment Issue (FIXED)
**Problem:** `genie-monitor/vite.config.mjs` was outputting to same directory as `genie-collection-editor/vite.config.js`, causing collection-editor to be overwritten.

**Fix Applied:**
```javascript
// genie-monitor/vite.config.mjs - CHANGED FROM:
outDir: `../public/genie-tools/collection-editor/`
// TO:
outDir: `../public/genie-tools/monitor/`
```

### 9.2 CTA System Integration

CTAs are configured per landing page in collections. The system has two scopes:

| Scope | Owner | Responsibilities |
|-------|-------|------------------|
| **Design & Selection** | GenieCloud | Build CTA assets, configure which appears where |
| **Execution & Tracking** | PLS/Genie App Team | Engagement Center, UTM, lead capture |

#### Available CTA Options

| ID | Name | Friction | Target % | Status |
|:--:|------|:--------:|:--------:|--------|
| 10 | Soft Follow (Tom Ferry) | LOW | 15-25% | 🔴 TO BUILD |
| 11 | Home Value Request | MEDIUM | 5-10% | 🔴 TO BUILD |
| 12 | SMS Brochure Request | LOW | 10-15% | 🔴 TO BUILD |
| 13 | Private Showing Request | MEDIUM | 8-12% | 🔴 TO BUILD |
| 14 | Get Notified | LOW | 12-18% | 🔴 TO BUILD |
| 0 | No CTA | - | - | ✅ EXISTS |
| 2 | Home Value (Full Form) | HIGH | 2-5% | ✅ EXISTS |

#### CTA in Collection JSON Schema

```json
{
  "sections": [{
    "assets": [{
      "asset": "landing-pages/lc-hollywood",
      "qrUrl": "lc-hollywood",
      "defaultCtaId": 10,
      "defaultCtaTrigger": "scroll",
      "defaultCtaTriggerValue": 50
    }]
  }]
}
```

#### Deployment Paths

| Path | Trigger | Flow |
|------|---------|------|
| **Automated (FarmCast)** | System event | Order → Workflow → SMS → Landing → CTA |
| **Non-Automated (Static)** | Human distribution | Flyer/QR → Landing → CTA |

### 9.3 Customer Asset Configurator

A new admin UI that combines Theme Editor + Collection Editor + CTA Configuration.

📍 **Figma Spec:** [CUSTOMER_ASSET_CONFIGURATOR_SPEC_v1.html](file:///D:/Cursor/TheGenie.ai/Development/Paisley/Pre.Listing.Command/Docs/CUSTOMER_ASSET_CONFIGURATOR_SPEC_v1.html)

**5 Pillars:**
1. 🎨 Theme Selection
2. ✏️ Theme Editing
3. 📦 Collection Building
4. 🔗 Service Assignment
5. 🎯 CTA Configuration

### 9.4 Integration Roadmap

| Phase | Task | Status |
|-------|------|--------|
| 1 | Fix genie-monitor build path | ✅ DONE |
| 2 | Rebuild & deploy Collection Editor | ⏳ IN PROGRESS |
| 3 | Create admin-only Dashboard route | ⏳ PENDING |
| 4 | Add permission guard (SuperUser) | ⏳ PENDING |
| 5 | Build CTA assets | ⏳ PENDING |
| 6 | Add CTA config to Collection JSON | ⏳ PENDING |
| 7 | Build Customer Configurator wrapper | ⏳ PENDING |

### 9.5 Related Documents

| Document | Location |
|----------|----------|
| PLS↔GenieCloud Contract | [CONTRACT_PLS_to_GenieCloud_v4.md](file:///D:/Cursor/TheGenie.ai/Development/Paisley/Pre.Listing.Command/Docs/CONTRACT_PLS_to_GenieCloud_v4.md) |
| Collection Editor Integration | [COLLECTION_EDITOR_ADMIN_INTEGRATION_v1.md](file:///D:/Cursor/TheGenie.ai/Development/Paisley/Pre.Listing.Command/Docs/COLLECTION_EDITOR_ADMIN_INTEGRATION_v1.md) |
| Customer Configurator Figma | [CUSTOMER_ASSET_CONFIGURATOR_SPEC_v1.html](file:///D:/Cursor/TheGenie.ai/Development/Paisley/Pre.Listing.Command/Docs/CUSTOMER_ASSET_CONFIGURATOR_SPEC_v1.html) |

---

## 10. ENHANCEMENT WISHLIST

### High Priority

1. **Theme Builder UI** - Visual editor with live preview
2. **Multi-Asset Preview** - Preview theme across all asset types
3. **Theme Inheritance** - Base themes with overrides

### Medium Priority

4. **Theme Versioning** - Track changes, rollback
5. **Organization Defaults** - Cascade themes by org
6. **Theme Validation** - WCAG accessibility checks

### Nice to Have

7. **Theme Analytics** - Usage tracking
8. **Theme Marketplace** - Browse/apply gallery
9. **AI Theme Generator** - Generate from logo/brand
10. **Theme Scheduling** - Holiday themes auto-apply

---

## 11. CHANGE LOG

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| **2.0** | **12/28/2025** | **Cursor AI** | **MAJOR UPDATE:** Added Section 9 "Collection Editor & CTA Integration" with: Collection Editor tool documentation, deployment fix, CTA system overview, available CTA options, CTA in Collection JSON schema, deployment paths (Automated/Static), Customer Asset Configurator overview, integration roadmap, related documents. Updated TOC. |
| 1.0 | 12/28/2025 | Cursor AI | Initial consolidated specification |

---

## DOCUMENTS CONSOLIDATED INTO THIS SPEC

1. `THEME_SYSTEM_SOP_AND_ARCHITECTURE_v1.md` - Theme creation SOP
2. `THEME_SYSTEM_REVERSE_ENGINEERING_v1.md` - Theme discovery
3. `XSLT_KNOWLEDGE_BASE_v1.md` - XSL/XSLT reference
4. `QA_SESSION_LOG_v1.md` - Bug discoveries
5. `ASSET_RENDERING_CHANGELOG_v1.md` - Fix history

---

## PRODUCTION REFERENCE EXAMPLES

**⚠️ ALWAYS CHECK THESE FIRST before any asset work:**

| Example | URL |
|---------|-----|
| Dainelle Scott Collection (Gold Standard) | [cloud.thegenie.ai/genie-collection/15a521b8-3fbf-4042-bce3-58e378cd9a52](https://cloud.thegenie.ai/genie-collection/15a521b8-3fbf-4042-bce3-58e378cd9a52) |
| Working Production Test | [cloud.thegenie.ai/genie-collection/49d3421e-e538-40c5-a54f-52218602f6db](https://cloud.thegenie.ai/genie-collection/49d3421e-e538-40c5-a54f-52218602f6db) |

---

*This is the SINGLE SOURCE OF TRUTH for GenieCloud asset development.*

