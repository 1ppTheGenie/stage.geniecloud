# TheGenie.ai Theme System
## Complete Documentation: SOP, Architecture & Enhancement Wishlist

---

| Field | Value |
|-------|-------|
| **Version** | 1.0 |
| **Created** | 12/26/2025 |
| **Author** | Cursor AI (Opus) |
| **Last Updated** | 12/26/2025 |

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Theme vs Template - Critical Distinction](#theme-vs-template)
3. [Theme Architecture](#theme-architecture)
4. [Admin SOP: Creating a New Theme](#admin-sop)
5. [Developer Reference: Technical Details](#developer-reference)
6. [Database Schema](#database-schema)
7. [File Locations](#file-locations)
8. [Enhancement Wishlist](#enhancement-wishlist)
9. [Change Log](#change-log)

---

## Executive Summary

The TheGenie.ai theme system provides **configurable visual styling** (colors, fonts) that can be applied to any template (websites, social ads, brochures, etc.) without modifying the underlying template code.

**Key Insight:** Themes are **settings/configuration** - Templates are **development/code**.

---

## Theme vs Template - Critical Distinction <a name="theme-vs-template"></a>

| Aspect | THEME | TEMPLATE |
|--------|-------|----------|
| **What it is** | Configuration/Settings | Development/Code |
| **Contains** | Colors, fonts, hex values | HTML structure, layout, logic |
| **File type** | `.css` (CSS variables) | `.xsl`, `.html`, `.css` (layout) |
| **Who manages** | Admins, Brand Managers | Developers |
| **Impact of change** | Visual styling only | Layout, structure, functionality |
| **Risk level** | Low (just colors) | High (can break pages) |
| **Versioning** | `theme-name.css` | Clone to `template-v2.xsl` |

### Golden Rule
> **Never modify a working template. Clone it first.**
> Theme changes are safe. Template changes require new versions.

---

## Theme Architecture <a name="theme-architecture"></a>

### How Themes Work - The Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                         XML DATA SOURCE                          │
│  <output theme="apple-black" themeHue="dark" ... />             │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                      XSL TRANSFORMATION                          │
│  Reads theme/themeHue attributes, generates:                    │
│  <html class="... apple-black dark ...">                        │
│  <link href="/_assets/themes/apple-black.css">                  │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                         CSS VARIABLES                            │
│  .apple-black.dark {                                            │
│    --theme-body-background: #000000;                            │
│    --theme-heading-color: #f5f5f7;                              │
│    --theme-body-font: -apple-system, ...;                       │
│  }                                                               │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                      RENDERED OUTPUT                             │
│  Template elements use CSS variables:                           │
│  fill="var(--theme-body-background)"                            │
│  color: var(--theme-heading-color);                             │
└─────────────────────────────────────────────────────────────────┘
```

### CSS Variable Reference

| Variable | Purpose | Example Value |
|----------|---------|---------------|
| `--theme-body-background` | Page/section backgrounds | `#000000` |
| `--theme-heading-color` | H1, H2, major headings | `#f5f5f7` |
| `--theme-sub-heading-color` | Subtitles, captions | `#86868b` |
| `--theme-body-color` | Paragraph text | `#f5f5f7` |
| `--theme-emphasis-color` | CTAs, links, accents | `#2997ff` |
| `--theme-body-font` | Body text font stack | `-apple-system, ...` |
| `--theme-heading-font` | Heading font stack | `-apple-system, ...` |
| `--theme-sub-heading-font` | Subheading font stack | `-apple-system, ...` |

### Theme Modes

Each theme typically has TWO variants:
- **Light Mode** (`.theme-name.light`) - Light background, dark text
- **Dark Mode** (`.theme-name.dark`) - Dark background, light text

---

## Admin SOP: Creating a New Theme <a name="admin-sop"></a>

### Prerequisites
- Access to S3 bucket (`genie-cloud`)
- Database write access (SA credentials)
- Access to Hub Theme Manager (`app.thegenie.ai/agent/#/admin/hub-themes`)

### Step-by-Step Process

#### Step 1: Create the CSS File

1. **Clone an existing theme** as starting point:
   ```
   Copy: themes/compass.css → themes/new-theme-name.css
   ```

2. **Edit the CSS variables** for both light and dark modes:
   ```css
   .new-theme-name.light, .new-theme-name .light {
       --theme-body-background: #ffffff;
       --theme-heading-color: #1d1d1f;
       --theme-sub-heading-color: #86868b;
       --theme-body-color: #1d1d1f;
       --theme-emphasis-color: #0071e3;
       --theme-body-font: -apple-system, BlinkMacSystemFont, sans-serif;
       --theme-heading-font: -apple-system, BlinkMacSystemFont, sans-serif;
       --theme-sub-heading-font: -apple-system, BlinkMacSystemFont, sans-serif;
   }

   .new-theme-name.dark, .new-theme-name .dark {
       --theme-body-background: #000000;
       --theme-heading-color: #f5f5f7;
       --theme-sub-heading-color: #86868b;
       --theme-body-color: #f5f5f7;
       --theme-emphasis-color: #2997ff;
   }
   ```

3. **Add gradient overrides** if template uses `.gradient-color` classes:
   ```css
   .new-theme-name .gradient-color {
       background: none !important;
       -webkit-background-clip: unset !important;
       -webkit-text-fill-color: inherit !important;
   }
   ```

#### Step 2: Upload to S3

```python
import boto3

session = boto3.Session(profile_name='genie-hub-active')
s3 = session.client('s3', region_name='us-west-1')

with open('themes/new-theme-name.css', 'r') as f:
    css_content = f.read()

s3.put_object(
    Bucket='genie-cloud',
    Key='_assets/themes/new-theme-name.css',
    Body=css_content,
    ContentType='text/css'
)
```

**Result:** Theme available at `https://cloud.thegenie.ai/_assets/themes/new-theme-name.css`

#### Step 3: Register in Database

```sql
-- Insert Dark variant
INSERT INTO dbo.HubTheme (
    ThemeDisplayName, SelectValueReadable, IsDark, IsEnabled, 
    IsUserDefined, CreateDate, ParamTheme, ParamHue
) VALUES (
    'New Theme Name Dark', 'New Theme Name Dark', 1, 1, 
    0, GETDATE(), 'new-theme-name', 'dark'
);

-- Insert Light variant
INSERT INTO dbo.HubTheme (
    ThemeDisplayName, SelectValueReadable, IsDark, IsEnabled, 
    IsUserDefined, CreateDate, ParamTheme, ParamHue
) VALUES (
    'New Theme Name Light', 'New Theme Name Light', 0, 1, 
    0, GETDATE(), 'new-theme-name', 'light'
);
```

#### Step 4: Set Availability (Optional)

To restrict theme to specific users/organizations:

```sql
-- Make available to specific user
INSERT INTO dbo.HubThemeAvailability 
(HubThemeId, RoleId, AspNetUserId, OrganizationId, CreateDate)
VALUES (@ThemeId, NULL, 'user-guid-here', NULL, GETDATE());

-- Make available to organization
INSERT INTO dbo.HubThemeAvailability 
(HubThemeId, RoleId, AspNetUserId, OrganizationId, CreateDate)
VALUES (@ThemeId, NULL, NULL, @OrgId, GETDATE());
```

#### Step 5: Sync in Admin Panel

1. Navigate to: `app.thegenie.ai/agent/#/admin/hub-themes`
2. Click **"Sync New Hub Themes"**
3. Verify theme appears in dropdown
4. Optionally upload default logos for the theme

#### Step 6: Test

1. Create a test page using the new theme
2. Verify all elements render correctly
3. Check both light and dark modes
4. Test on mobile devices

---

## Developer Reference: Technical Details <a name="developer-reference"></a>

### Source Code Locations

| Component | Path |
|-----------|------|
| Theme Model | `Smart.Model/Hub/MarketingHubTheme.cs` |
| Theme Response | `Smart.Model/Hub/HubThemesResponse.cs` |
| Theme Logo Request | `Smart.Model/Hub/HubThemeDefaultLogoRequest.cs` |
| Database Mappings | `Smart.Data/SQL/FarmGenie.dbml` |
| Theme Editor (UI) | `genie-theme-editor/src/` |

### API Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/wp-json/genie/v1/get-themes` | GET | List available themes |
| `/wp-json/genie/v1/update-theme` | POST | Create/update theme |

### XSL Theme Integration

The XSL templates read theme from XML and generate appropriate classes:

```xml
<!-- In XSL template -->
<xsl:attribute name="class">
    <xsl:value-of select="//output/@theme"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="//output/@themeHue"/>
</xsl:attribute>
```

### Database Connection

```
Server: 192.168.29.45,1433 (or server-mssql1.istrategy.com)
Database: FarmGenie
Read-Only User: cursor / 1ppINSAyay$
Write User: sa / neo222
```

---

## Database Schema <a name="database-schema"></a>

### Table: dbo.HubTheme

| Column | Type | Description |
|--------|------|-------------|
| `HubThemeId` | INT (PK, Identity) | Unique theme ID |
| `ThemeDisplayName` | VARCHAR(500) | Display name in UI |
| `SelectValueReadable` | VARCHAR(500) | Dropdown display text |
| `IsDark` | BIT | TRUE = dark mode variant |
| `IsEnabled` | BIT | Active/Inactive |
| `IsUserDefined` | BIT | Custom vs System theme |
| `CreateDate` | DATETIME | Creation timestamp |
| `DefaultLogoDark` | VARCHAR(250) | Default logo for dark bg |
| `DefaultLogoLight` | VARCHAR(250) | Default logo for light bg |
| `ParamTheme` | VARCHAR(100) | CSS filename (e.g., "apple-black") |
| `ParamHue` | VARCHAR(50) | "dark" or "light" |

### Table: dbo.HubThemeAvailability

| Column | Type | Description |
|--------|------|-------------|
| `HubThemeAvailabilityId` | INT (PK) | Unique ID |
| `HubThemeId` | INT (FK) | Links to HubTheme |
| `RoleId` | INT | Role-based access (nullable) |
| `AspNetUserId` | NVARCHAR(128) | User-specific access (nullable) |
| `OrganizationId` | INT | Org-based access (nullable) |
| `CreateDate` | DATETIME | Creation timestamp |

### Table: dbo.UserCustomHubTheme

| Column | Type | Description |
|--------|------|-------------|
| `UserCustomHubThemeId` | INT (PK) | Unique ID |
| `AspNetUserId` | NVARCHAR(128) | User who created |
| `ThemeName` | VARCHAR(255) | Custom theme name |
| `ThemeData` | NVARCHAR(MAX) | JSON of custom settings |
| `CreateDate` | DATETIME | Creation timestamp |

---

## File Locations <a name="file-locations"></a>

### Production (S3)

| Asset | S3 Path | URL |
|-------|---------|-----|
| Theme CSS | `genie-cloud/_assets/themes/` | `cloud.thegenie.ai/_assets/themes/` |
| Template CSS | `genie-cloud/_assets/landing-pages/css/` | `cloud.thegenie.ai/_assets/landing-pages/css/` |
| XSL Templates | `genie-cloud/_assets/_xsl/landing-pages/` | Internal only |

### Local Development

| Asset | Path |
|-------|------|
| Theme CSS (dev) | `D:\Cursor\_SourceCode\stage.geniecloud\themes\` |
| Source Code | `D:\Cursor\_SourceCode\Genie.Source.Code_v1\` |
| Documentation | `D:\Cursor\TheGenie.ai\Development\Paisley\Pre.Listing.Command\Docs\` |

---

## Enhancement Wishlist <a name="enhancement-wishlist"></a>

Based on our session, here are recommended enhancements to make the theme system more scalable and easier to manage:

### 🥇 High Priority

#### 1. Theme Builder UI
**Description:** Web-based interface for creating/editing themes with real-time preview.

**Features:**
- Color picker for each CSS variable
- Font selector with preview
- Live preview panel showing changes on sample assets
- Toggle between light/dark mode preview
- Export to CSS with one click
- Automatic S3 upload and database registration

**Benefit:** Empowers admins to create themes without developer assistance.

#### 2. Multi-Asset Preview
**Description:** Preview theme across ALL asset types before deployment.

**Asset Types to Preview:**
- Landing pages (PLS Hollywood, LC Hollywood, etc.)
- Social media ads (Facebook, Instagram, LinkedIn)
- Brochures and flyers
- Email templates
- Market reports

**Benefit:** Ensures theme works across entire asset ecosystem, not just websites.

#### 3. Theme Inheritance/Variants
**Description:** Allow themes to inherit from a base theme and override specific values.

```css
/* Base theme */
.corporate-base { ... }

/* Variant inherits and overrides */
.corporate-holiday extends .corporate-base {
    --theme-emphasis-color: #c41e3a; /* Holiday red */
}
```

**Benefit:** Reduces duplication, easier seasonal updates.

### 🥈 Medium Priority

#### 4. Theme Versioning & Rollback
**Description:** Track theme changes with version history and one-click rollback.

**Features:**
- Automatic versioning on each save
- Side-by-side comparison of versions
- Rollback to any previous version
- Audit log of who changed what

**Benefit:** Safety net for theme changes, accountability.

#### 5. Organization Theme Defaults
**Description:** Set default themes at the organization level that cascade to all users.

**Hierarchy:**
```
System Default → Organization Default → User Override
```

**Benefit:** Streamlines onboarding for large organizations (e.g., Compass, Coldwell Banker).

#### 6. Theme Validation
**Description:** Automated checks before theme deployment.

**Validations:**
- Color contrast accessibility (WCAG AA/AAA)
- Font availability check
- CSS syntax validation
- Variable completeness check

**Benefit:** Prevents broken or inaccessible themes from being published.

### 🥉 Nice to Have

#### 7. Theme Analytics
**Description:** Track which themes are used most, by which users/orgs.

**Metrics:**
- Theme usage count by asset type
- Most popular themes
- Unused themes (candidates for deprecation)

#### 8. Theme Marketplace
**Description:** Gallery of pre-built themes users can browse and apply.

**Features:**
- Thumbnail previews
- Filter by style (modern, classic, bold, minimal)
- One-click apply
- Community ratings

#### 9. AI Theme Generator
**Description:** Generate theme from brand guidelines or logo.

**Input:** Upload logo or enter brand colors
**Output:** Complete theme with complementary colors, suggested fonts

#### 10. Theme Scheduling
**Description:** Schedule theme changes for specific dates.

**Use Cases:**
- Holiday themes (automatically apply Dec 1, revert Jan 2)
- Seasonal campaigns
- Event-specific branding

---

## Lessons Learned

1. **Theme ≠ Template** - This distinction is critical. Themes are safe to modify; templates require cloning.

2. **Gradient Overrides Required** - Some templates have hardcoded `.gradient-color` classes that need explicit overrides in theme CSS.

3. **Database + S3 + Sync** - Three steps required: upload CSS, register in DB, sync in admin panel.

4. **Test All Asset Types** - A theme that looks good on websites may not work for social ads.

5. **SA Credentials for Writes** - The `cursor` database user is read-only. Use `sa` for INSERT/UPDATE operations.

---

## Change Log <a name="change-log"></a>

| Version | Date | Changes |
|:-------:|------|---------|
| 1.0 | 12/26/2025 | Initial documentation created from reverse engineering session. Includes SOP, architecture, database schema, and enhancement wishlist. |

---

*Document Location: `D:\Cursor\TheGenie.ai\Development\Paisley\Pre.Listing.Command\Docs\THEME_SYSTEM_SOP_AND_ARCHITECTURE_v1.md`*

