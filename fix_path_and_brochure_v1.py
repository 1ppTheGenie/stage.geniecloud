"""
Fix URL Path and Brochure Button
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Downloads the current page
2. Fixes the brochure button to show "Coming Soon" or disable it
3. Deploys to both lc-hollywood and pls-hollywood paths

CHANGE LOG:
v1.0 - 12/25/2025 - Fix brochure button, deploy to correct path
"""

import requests
import boto3
import re

# Configuration
CURRENT_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-brochure-fixed.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

# S3 paths - deploy to both for now
S3_KEYS = [
    'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html',
    'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
]

def main():
    print("=== DOWNLOADING CURRENT PAGE ===")
    response = requests.get(CURRENT_URL)
    response.raise_for_status()
    html_content = response.text
    print(f"Downloaded {len(html_content)} characters")
    
    print("\n=== FIXING BROCHURE BUTTON ===")
    
    # Option 1: Change the button text to indicate brochure is coming
    # Find: <a class="pdf-btn" target="_blank" href="" data-genie-tags="DownloadPropertyBrochure,ClickCta">
    #       <div class="overlay-bg"><!----></div><span class="gradient-color">Download Property Brochure</span></a>
    
    # Replace empty href with javascript:void(0) and change button text
    html_content = html_content.replace(
        '<a class="pdf-btn" target="_blank" href="" data-genie-tags="DownloadPropertyBrochure,ClickCta">',
        '<a class="pdf-btn" target="_blank" href="javascript:alert(\'Property brochure coming soon! Contact Steve Hundley for more information.\')" data-genie-tags="DownloadPropertyBrochure,ClickCta">'
    )
    
    # Also update the button text to indicate it's coming soon
    html_content = html_content.replace(
        '<span class="gradient-color">Download Property Brochure</span>',
        '<span class="gradient-color">Request Property Brochure</span>'
    )
    
    print("Fixed brochure button - now shows 'Request Property Brochure' with alert")
    
    # Save locally
    with open(LOCAL_PATH, 'w', encoding='utf-8') as f:
        f.write(html_content)
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
    print("FIXES APPLIED:")
    print("1. Brochure button now says 'Request Property Brochure'")
    print("2. Clicking shows alert with contact info")
    print("3. Deployed to BOTH paths for compatibility")
    print("")
    print("CANONICAL URL (use for QR code):")
    print("https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html")
    print("="*60)

if __name__ == '__main__':
    main()

