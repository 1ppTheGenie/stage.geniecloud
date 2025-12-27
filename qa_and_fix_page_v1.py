"""
QA and Fix PLS Page - All Encoding Issues
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

Purpose: Thoroughly scan and fix ALL encoding issues in the PLS landing page

CHANGE LOG:
v1.0 - 12/25/2025 - Initial QA script
"""

import requests
import re
import boto3

# Download current production page
print("=== DOWNLOADING PRODUCTION PAGE ===")
url = "https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html"
response = requests.get(url)
html = response.text

print(f"Downloaded {len(html)} characters")

# === SCAN FOR ALL ISSUES ===
print("\n=== SCANNING FOR ENCODING ISSUES ===")

issues = []

# 1. Â character (misencoded nbsp)
a_matches = re.findall(r'Â', html)
print(f"Found {len(a_matches)} instances of 'Â' character")
if a_matches:
    issues.append(("Â", len(a_matches)))

# 2. smart apostrophe encoding issue
smart_apos = re.findall(r'\xe2\x80\x99', html)
print(f"Found {len(smart_apos)} instances of smart apostrophe issues")
if smart_apos:
    issues.append(("smart_apos", len(smart_apos)))

# 3. em dash encoding issue
em_dash = re.findall(r'\xe2\x80\x94', html)
print(f"Found {len(em_dash)} instances of em dash issues")
if em_dash:
    issues.append(("em_dash", len(em_dash)))

# 4. smart quotes
smart_quotes = re.findall(r'\xe2\x80[\x9c\x9d]', html)
print(f"Found {len(smart_quotes)} instances of smart quote issues")
if smart_quotes:
    issues.append(("smart quotes", len(smart_quotes)))

# 5. 'undefined' text (JavaScript rendering issue)
undefined_matches = re.findall(r'undefined', html)
print(f"Found {len(undefined_matches)} instances of 'undefined' text")
if undefined_matches:
    issues.append(("undefined", len(undefined_matches)))

# 6. NaN (JavaScript rendering issue)
nan_matches = re.findall(r'NaN', html)
print(f"Found {len(nan_matches)} instances of 'NaN' text")
if nan_matches:
    issues.append(("NaN", len(nan_matches)))

# 7. Empty/broken URLs
empty_urls = re.findall(r'href=""', html)
print(f"Found {len(empty_urls)} empty href URLs")
if empty_urls:
    issues.append(("empty href", len(empty_urls)))

# 8. &#160; or &nbsp; that might cause issues
nbsp_entities = re.findall(r'&#160;|&nbsp;', html)
print(f"Found {len(nbsp_entities)} nbsp entities (may or may not be issues)")

# Show context for each Â occurrence
print("\n=== CONTEXT FOR 'Â' OCCURRENCES ===")
for i, match in enumerate(re.finditer(r'.{0,30}Â.{0,30}', html)):
    if i < 15:  # Show first 15
        context = match.group().replace('\n', ' ')
        print(f"  {i+1}. ...{context}...")

# === FIX ALL ISSUES ===
print("\n=== APPLYING FIXES ===")

fixed_html = html

# Fix 1: Remove Â followed by space (misencoded nbsp)
fixed_html = fixed_html.replace('Â ', ' ')
fixed_html = fixed_html.replace('Â', '')
print("Fixed: Removed all Â characters")

# Fix 2: Fix smart apostrophe
fixed_html = fixed_html.replace('\u2019', "'")
print("Fixed: Replaced smart apostrophes")

# Fix 3: Fix em dash
fixed_html = fixed_html.replace('\u2014', '-')
print("Fixed: Replaced em dashes")

# Fix 4: Fix smart quotes
fixed_html = fixed_html.replace('\u201c', '"')
fixed_html = fixed_html.replace('\u201d', '"')
print("Fixed: Replaced smart quotes")

# Fix 5: Replace nbsp entities with regular spaces
fixed_html = fixed_html.replace('&#160;', ' ')
# Keep &nbsp; as-is since it's valid HTML

# Verify fixes
print("\n=== VERIFYING FIXES ===")
remaining_a = len(re.findall(r'Â', fixed_html))
print(f"Remaining Â characters: {remaining_a}")

# Save fixed version locally
local_path = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-qa-fixed.html'
with open(local_path, 'w', encoding='utf-8') as f:
    f.write(fixed_html)
print(f"\nSaved fixed version to: {local_path}")

# Deploy to S3
print("\n=== DEPLOYING FIXED VERSION ===")
session = boto3.Session(profile_name='genie-hub-active')
s3 = session.client('s3', region_name='us-west-1')

s3.put_object(
    Bucket='genie-cloud',
    Key='genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html',
    Body=fixed_html.encode('utf-8'),
    ContentType='text/html; charset=utf-8',
    CacheControl='max-age=0'
)

print("DEPLOYED!")
print("\nURL: https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html")
print("\nPlease refresh the page (Ctrl+Shift+R for hard refresh) to see the fixes.")

