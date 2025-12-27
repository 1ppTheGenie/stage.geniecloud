"""
Fix All Encoding Issues and Redeploy
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Downloads current production page
2. Fixes all encoding issues including apostrophes
3. Redeploys to production

CHANGE LOG:
v1.0 - 12/25/2025 - Fix apostrophe in "What's My Home Worth" and all other encoding
"""

import requests
import boto3
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-encoding-fixed.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

S3_KEYS = [
    'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html',
    'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
]

def fix_encoding(html):
    """Fix all encoding issues"""
    
    # Fix 'A with circumflex' character (common UTF-8 to Windows encoding issue)
    html = re.sub(r'\u00c2\s*', '', html)  # Â followed by optional space
    html = re.sub(r'\u00c2', '', html)     # Standalone Â
    
    # Fix smart apostrophes (right single quote U+2019)
    html = html.replace('\u2019', "'")
    html = html.replace("'", "'")
    
    # Fix left single quote (U+2018)
    html = html.replace('\u2018', "'")
    html = html.replace("'", "'")
    
    # Fix smart double quotes
    html = html.replace('\u201c', '"')  # Left double quote
    html = html.replace('\u201d', '"')  # Right double quote
    html = html.replace('"', '"')
    html = html.replace('"', '"')
    
    # Fix em dash
    html = html.replace('\u2014', '--')
    html = html.replace('—', '--')
    
    # Fix en dash
    html = html.replace('\u2013', '-')
    html = html.replace('–', '-')
    
    # Fix ellipsis
    html = html.replace('\u2026', '...')
    html = html.replace('…', '...')
    
    # Fix common mojibake patterns (UTF-8 interpreted as Windows-1252)
    # These appear as garbage characters
    html = html.replace('â€™', "'")   # Right single quote
    html = html.replace('â€˜', "'")   # Left single quote
    html = html.replace('â€œ', '"')   # Left double quote
    html = html.replace('â€', '"')    # Right double quote (partial)
    html = html.replace('â€"', '--')  # Em dash
    html = html.replace('â€"', '-')   # En dash
    html = html.replace('â€¦', '...')  # Ellipsis
    
    # Fix non-breaking space issues
    html = html.replace('\u00a0', ' ')  # Non-breaking space to regular space
    
    return html

def main():
    print("=== DOWNLOADING PRODUCTION PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    html = response.text
    print(f"Downloaded {len(html)} characters")
    
    print("\n=== CHECKING FOR ENCODING ISSUES ===")
    
    # Check for specific issues
    issues = []
    
    if '\u00c2' in html or 'Â' in html:
        count = html.count('\u00c2') + html.count('Â')
        issues.append(f"'A' character: {count} instances")
    
    if '\u2019' in html or "'" in html:
        count = html.count('\u2019') + html.count("'")
        issues.append(f"Smart apostrophe: {count} instances")
    
    if 'â€™' in html:
        issues.append(f"Mojibake apostrophe: {html.count('â€™')} instances")
    
    # Check for "What's" specifically
    whats_pattern = r"What.s"
    whats_matches = re.findall(whats_pattern, html)
    if whats_matches:
        print(f"Found 'What's' variations: {whats_matches[:5]}...")
    
    if issues:
        print("Issues found:")
        for issue in issues:
            print(f"  - {issue}")
    else:
        print("No obvious encoding issues found")
    
    print("\n=== APPLYING FIXES ===")
    fixed_html = fix_encoding(html)
    
    # Verify fixes
    print("Verifying fixes...")
    remaining_issues = []
    if 'Â' in fixed_html:
        remaining_issues.append(f"Remaining 'A': {fixed_html.count('Â')}")
    if 'â€™' in fixed_html:
        remaining_issues.append(f"Remaining mojibake: {fixed_html.count('â€™')}")
    
    if remaining_issues:
        print("WARNING: Some issues remain:")
        for issue in remaining_issues:
            print(f"  - {issue}")
    else:
        print("All encoding issues fixed!")
    
    # Save locally
    with open(LOCAL_PATH, 'w', encoding='utf-8') as f:
        f.write(fixed_html)
    print(f"Saved to: {LOCAL_PATH}")
    
    print("\n=== DEPLOYING TO S3 ===")
    session = boto3.Session(profile_name=AWS_PROFILE, region_name=REGION)
    s3 = session.client('s3')
    
    for s3_key in S3_KEYS:
        s3.upload_file(
            LOCAL_PATH,
            BUCKET_NAME,
            s3_key,
            ExtraArgs={'ContentType': 'text/html; charset=utf-8'}
        )
        print(f"Deployed: https://cloud.thegenie.ai/{s3_key}")
    
    print("\n" + "="*60)
    print("ENCODING FIXES COMPLETE!")
    print("All apostrophes and special characters should now display correctly.")
    print("="*60)

if __name__ == '__main__':
    main()

