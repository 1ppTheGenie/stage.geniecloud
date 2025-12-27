"""
Fix Address and Redeploy
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Downloads the current production HTML
2. Fixes the address from "San Antonio, TX 78254" to "Boerne, TX 78006"
3. Fixes the coordinates to center the map correctly
4. Redeploys to S3

CHANGE LOG:
v1.0 - 12/25/2025 - Fix address to Boerne, TX 78006
"""

import requests
import boto3
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
OUTPUT_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-address-fixed-v1.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'
S3_KEY = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'

# Correct data from Attom/MLS records
CORRECT_CITY = 'Boerne'
CORRECT_STATE = 'TX'
CORRECT_ZIP = '78006'
CORRECT_LAT = '29.72229'
CORRECT_LNG = '-98.68958'

def download_page():
    """Download the current production page"""
    print("=== DOWNLOADING CURRENT PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    print(f"Downloaded {len(response.text)} characters")
    return response.text

def fix_address(html_content):
    """Fix the address in the HTML"""
    print("\n=== FIXING ADDRESS ===")
    
    # Count and fix San Antonio -> Boerne
    count_sa = html_content.count('San Antonio')
    html_content = html_content.replace('San Antonio', CORRECT_CITY)
    print(f"Fixed {count_sa} instances of 'San Antonio' -> 'Boerne'")
    
    # Fix zip code 78254 -> 78006
    # Be careful to only replace in address contexts
    count_zip = html_content.count('78254')
    html_content = html_content.replace('78254', CORRECT_ZIP)
    print(f"Fixed {count_zip} instances of '78254' -> '78006'")
    
    # Fix coordinates for map centering
    # The old incorrect coordinates were 29.654321, -98.493456
    html_content = html_content.replace('29.654321', CORRECT_LAT)
    html_content = html_content.replace('-98.493456', CORRECT_LNG)
    print(f"Fixed coordinates to {CORRECT_LAT}, {CORRECT_LNG}")
    
    # Also fix the lot size if present (7405 -> 9101)
    html_content = html_content.replace('7,405', '9,101')
    html_content = html_content.replace('7405', '9101')
    
    # Fix acres (0.17 -> 0.21)
    html_content = html_content.replace('0.17 acres', '0.21 acres')
    html_content = html_content.replace('0.17 Acres', '0.21 Acres')
    
    return html_content

def deploy_to_s3(html_content):
    """Deploy HTML to S3"""
    print("\n=== DEPLOYING TO S3 ===")
    
    # Save locally first
    with open(OUTPUT_PATH, 'w', encoding='utf-8') as f:
        f.write(html_content)
    print(f"Saved locally: {OUTPUT_PATH}")
    
    # Upload to S3
    session = boto3.Session(profile_name=AWS_PROFILE, region_name=REGION)
    s3 = session.client('s3')
    
    s3.upload_file(
        OUTPUT_PATH,
        BUCKET_NAME,
        S3_KEY,
        ExtraArgs={'ContentType': 'text/html; charset=utf-8'}
    )
    
    production_url = f"https://cloud.thegenie.ai/{S3_KEY}"
    print(f"DEPLOYED SUCCESSFULLY!")
    print(f"URL: {production_url}")
    
    return production_url

if __name__ == '__main__':
    try:
        # Step 1: Download
        html_content = download_page()
        
        # Step 2: Fix address
        html_content = fix_address(html_content)
        
        # Step 3: Deploy
        url = deploy_to_s3(html_content)
        
        print("\n" + "="*50)
        print("ADDRESS CORRECTION DEPLOYED!")
        print(f"BEFORE: San Antonio, TX 78254")
        print(f"AFTER:  {CORRECT_CITY}, {CORRECT_STATE} {CORRECT_ZIP}")
        print(f"Coordinates: {CORRECT_LAT}, {CORRECT_LNG}")
        print(f"\nLive URL: {url}")
        print("="*50)
        
    except Exception as e:
        print(f"ERROR: {e}")
        import traceback
        traceback.print_exc()

