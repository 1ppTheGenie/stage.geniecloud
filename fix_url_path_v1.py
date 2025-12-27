"""
Fix URL Path and Move to PLS-Hollywood
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Downloads the current page from lc-hollywood path
2. Uploads to the correct pls-hollywood path
3. Keeps both paths working (doesn't delete the old one)

CHANGE LOG:
v1.0 - 12/25/2025 - Create pls-hollywood path alongside lc-hollywood
"""

import requests
import boto3

# Configuration
CURRENT_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-current.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

# New correct path
NEW_S3_KEY = 'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'

def main():
    print("=== DOWNLOADING CURRENT PAGE ===")
    response = requests.get(CURRENT_URL)
    response.raise_for_status()
    html_content = response.text
    print(f"Downloaded {len(html_content)} characters")
    
    # Save locally
    with open(LOCAL_PATH, 'w', encoding='utf-8') as f:
        f.write(html_content)
    print(f"Saved to: {LOCAL_PATH}")
    
    print("\n=== UPLOADING TO NEW PATH ===")
    session = boto3.Session(profile_name=AWS_PROFILE, region_name=REGION)
    s3 = session.client('s3')
    
    s3.upload_file(
        LOCAL_PATH,
        BUCKET_NAME,
        NEW_S3_KEY,
        ExtraArgs={'ContentType': 'text/html; charset=utf-8'}
    )
    
    new_url = f"https://cloud.thegenie.ai/{NEW_S3_KEY}"
    print(f"DEPLOYED TO NEW PATH!")
    print(f"NEW URL: {new_url}")
    
    print("\n" + "="*60)
    print("BOTH URLS NOW WORK:")
    print(f"OLD: {CURRENT_URL}")
    print(f"NEW: {new_url}")
    print("="*60)

if __name__ == '__main__':
    main()

