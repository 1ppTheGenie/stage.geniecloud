"""
Fix Theme to Compass Dark
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

The page is showing "compass light" but should be "compass dark"

CHANGE LOG:
v1.0 - 12/25/2025 - Change theme from light to dark
"""

import requests
import boto3

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-dark-theme.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

S3_KEYS = [
    'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html',
    'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
]

def fix_theme(html):
    """Change theme from light to dark"""
    
    # Fix HTML class
    html = html.replace(
        'class="genie-landing-page compass light asset-v"',
        'class="genie-landing-page compass dark asset-v"'
    )
    print("1. Fixed HTML class: compass light -> compass dark")
    
    # Fix body class
    html = html.replace(
        'class="lc-hollywood pls-hollywood compass light"',
        'class="lc-hollywood pls-hollywood compass dark"'
    )
    print("2. Fixed body class: compass light -> compass dark")
    
    # Also check for any other "compass light" occurrences
    count = html.count('compass light')
    if count > 0:
        html = html.replace('compass light', 'compass dark')
        print(f"3. Fixed {count} additional 'compass light' occurrences")
    
    return html

def main():
    print("=== DOWNLOADING PRODUCTION PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    html = response.text
    print(f"Downloaded {len(html)} characters")
    
    print("\n=== FIXING THEME TO DARK ===")
    html = fix_theme(html)
    
    # Save locally
    with open(LOCAL_PATH, 'w', encoding='utf-8') as f:
        f.write(html)
    print(f"\nSaved to: {LOCAL_PATH}")
    
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
    print("THEME FIX COMPLETE!")
    print("")
    print("Changed: compass LIGHT -> compass DARK")
    print("")
    print("Hard refresh your browser (Ctrl+Shift+R) to see changes")
    print("="*60)

if __name__ == '__main__':
    main()

