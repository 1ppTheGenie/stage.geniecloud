"""
Render PLS XML to HTML and deploy to production
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Reads the XML and XSL files
2. Performs XSLT transformation using lxml
3. Post-processes the HTML to fix URLs and encoding
4. Deploys to S3

CHANGE LOG:
v1.0 - 12/25/2025 - Initial version with address correction (Boerne, TX 78006)
"""

import os
import re
from lxml import etree
import boto3

# Configuration
XML_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\genie-processor\xml\pls-10037-rebecca.xml'
XSL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\public\_assets\_xsl\landing-pages\pls-hollywood.xsl'
OUTPUT_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-rendered-v5.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'
S3_KEY = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'

def transform_xsl():
    """Perform XSLT transformation"""
    print("=== LOADING FILES ===")
    
    # Read XML
    with open(XML_PATH, 'rb') as f:
        xml_doc = etree.parse(f)
    print(f"Loaded XML: {XML_PATH}")
    
    # Read XSL
    with open(XSL_PATH, 'rb') as f:
        xsl_doc = etree.parse(f)
    print(f"Loaded XSL: {XSL_PATH}")
    
    print("\n=== TRANSFORMING ===")
    transform = etree.XSLT(xsl_doc)
    result = transform(xml_doc)
    
    html_content = str(result)
    print(f"Generated HTML: {len(html_content)} characters")
    
    return html_content

def post_process_html(html_content):
    """Fix URLs, encoding, and other issues"""
    print("\n=== POST-PROCESSING ===")
    
    # Fix site URLs
    html_content = html_content.replace(
        "https://genie-hub-2.s3.eu-west-2.amazonaws.com/",
        "https://cloud.thegenie.ai/"
    )
    html_content = html_content.replace(
        "https://genie-hub-2.s3.eu-west-2.amazonaws.com",
        "https://cloud.thegenie.ai"
    )
    print("Fixed siteUrl references")
    
    # Fix API URLs
    html_content = html_content.replace(
        "https://genie-api.dynamicarray.co.uk/",
        "https://cloud-api.thegenie.ai/"
    )
    print("Fixed apiUrl references")
    
    # Fix encoding issues
    html_content = html_content.replace('\u00c2 ', ' ')  # Â followed by space
    html_content = html_content.replace('\u00c2', '')     # Standalone Â
    html_content = html_content.replace('\u2019', "'")    # Smart apostrophe
    html_content = html_content.replace('\u2018', "'")    # Left single quote
    html_content = html_content.replace('\u201c', '"')    # Left double quote
    html_content = html_content.replace('\u201d', '"')    # Right double quote
    html_content = html_content.replace('\u2014', '--')   # Em dash
    print("Fixed encoding issues")
    
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
        # Step 1: Transform
        html_content = transform_xsl()
        
        # Step 2: Post-process
        html_content = post_process_html(html_content)
        
        # Step 3: Deploy
        url = deploy_to_s3(html_content)
        
        print("\n" + "="*50)
        print("ADDRESS CORRECTION DEPLOYED!")
        print("Correct: Boerne, TX 78006")
        print(f"Live URL: {url}")
        print("="*50)
        
    except Exception as e:
        print(f"ERROR: {e}")
        import traceback
        traceback.print_exc()

