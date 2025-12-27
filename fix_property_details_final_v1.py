"""
Final Property Details Fixes
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

Two tweaks:
1. Remove Price Per Square Foot completely
2. Change "Status: Private Listing" to "Listing Status: Private"

CHANGE LOG:
v1.0 - 12/25/2025 - Final property details cleanup
"""

import requests
import boto3
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-final-v2.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

S3_KEYS = [
    'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html',
    'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
]

def apply_fixes(html):
    """Apply the two property detail fixes"""
    
    # Fix 1: Remove Price Per Square Foot row completely
    # Pattern: <li class="body-color">...<strong>Price Per Sq. Ft.</strong>...$XXX...</li>
    price_sqft_pattern = r'<li class="body-color">\s*<strong>\s*Price Per Sq\.? ?Ft\.?\s*</strong>\s*<span>[^<]*</span>\s*</li>'
    html = re.sub(price_sqft_pattern, '', html, flags=re.IGNORECASE | re.DOTALL)
    print("1. Removed Price Per Square Foot row")
    
    # Fix 2: Change "Status" label to "Listing Status" and "Private Listing" to "Private"
    # First change the label
    html = re.sub(
        r'(<strong>)\s*Status\s*(</strong>)',
        r'\1Listing Status\2',
        html,
        flags=re.IGNORECASE
    )
    print("2. Changed 'Status' label to 'Listing Status'")
    
    # Then change "Private Listing" to just "Private"
    html = re.sub(
        r'(<span>)\s*Private Listing\s*(</span>)',
        r'\1Private\2',
        html,
        flags=re.IGNORECASE
    )
    print("3. Changed 'Private Listing' to 'Private'")
    
    return html

def main():
    print("=== DOWNLOADING PRODUCTION PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    html = response.text
    print(f"Downloaded {len(html)} characters")
    
    print("\n=== APPLYING FINAL PROPERTY DETAIL FIXES ===")
    html = apply_fixes(html)
    
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
    print("FINAL PROPERTY DETAILS FIXES COMPLETE!")
    print("")
    print("Changes:")
    print("  1. Removed: Price Per Square Foot")
    print("  2. Changed: 'Status: Private Listing'")
    print("         To: 'Listing Status: Private'")
    print("="*60)

if __name__ == '__main__':
    main()

