"""
Deploy PLS (Private Listing Service) Rendered HTML to Production - V3
Version: 3.0
Created: 12/25/2025
Author: Cursor AI

Purpose: Deploy the FULLY corrected 10037 Rebecca Place landing page
         - cloud-api.thegenie.ai API endpoint (not broken dynamicarray.co.uk)
         - cloud.thegenie.ai assets (not genie-hub-2 EU bucket)
         - compass light theme (not non-existent compass-dark)

CHANGE LOG:
v3.0 - 12/25/2025 - Fixed all URLs to use production cloud.thegenie.ai
"""

import boto3
import os

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

# File paths - using V4 with all URLs corrected
SOURCE_HTML = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-rendered-v4.html'
S3_KEY = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'

# Production URL that will be generated
PRODUCTION_URL = f'https://cloud.thegenie.ai/{S3_KEY}'

def deploy_to_s3():
    """Deploy the rendered HTML to S3"""
    print(f"Starting deployment to {BUCKET_NAME}...")
    print(f"Source: {SOURCE_HTML}")
    print(f"Destination: s3://{BUCKET_NAME}/{S3_KEY}")
    print(f"Production URL: {PRODUCTION_URL}")
    print("-" * 50)
    
    # Check source file exists
    if not os.path.exists(SOURCE_HTML):
        print(f"ERROR: Source file not found: {SOURCE_HTML}")
        return False
    
    # Read the HTML content
    with open(SOURCE_HTML, 'r', encoding='utf-8') as f:
        html_content = f.read()
    
    print(f"HTML content size: {len(html_content):,} bytes")
    
    # Verify correct API URL is in the HTML
    if 'cloud-api.thegenie.ai' in html_content:
        print("API URL: cloud-api.thegenie.ai - CORRECT")
    else:
        print("WARNING: cloud-api.thegenie.ai not found")
    
    # Verify ghUrl points to production
    if 'ghUrl = `https://cloud.thegenie.ai/_assets`' in html_content:
        print("ghUrl: cloud.thegenie.ai - CORRECT")
    else:
        print("WARNING: ghUrl not pointing to cloud.thegenie.ai")
    
    # Verify theme
    if 'compass light' in html_content:
        print("Theme: compass light - CORRECT")
    elif 'compass-dark' in html_content:
        print("ERROR: Still using compass-dark theme - ABORTING")
        return False
    
    # Create S3 session with the correct profile
    session = boto3.Session(profile_name=AWS_PROFILE)
    s3_client = session.client('s3', region_name=REGION)
    
    # Upload to S3
    try:
        s3_client.put_object(
            Bucket=BUCKET_NAME,
            Key=S3_KEY,
            Body=html_content.encode('utf-8'),
            ContentType='text/html',
            CacheControl='max-age=60'  # 1 minute cache for testing
        )
        print("SUCCESS: HTML uploaded to S3")
        print("-" * 50)
        print("PRODUCTION PAGE DEPLOYED!")
        print(f"URL: {PRODUCTION_URL}")
        return True
    except Exception as e:
        print(f"ERROR: Failed to upload to S3: {e}")
        return False

if __name__ == '__main__':
    deploy_to_s3()

