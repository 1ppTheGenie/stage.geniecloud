"""
Apply Property Details Fixes
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

Applies the 6 property detail changes:
1. Bathroom Full: 2 -> 3
2. School District: BOERNE ISD (new)
3. PLS # -> PRIVATE LISTING #
4. Garage Spaces: 2 -> 3
5. Type: LIKE NEW HOME
6. Neighborhood: BALCONES CREEK (new)

CHANGE LOG:
v1.0 - 12/25/2025 - Initial property details enhancement
"""

import requests
import boto3
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-property-details-fixed.html'

# AWS Configuration
BUCKET_NAME = 'genie-cloud'
REGION = 'us-west-1'
AWS_PROFILE = 'genie-hub-active'

S3_KEYS = [
    'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html',
    'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
]

def apply_fixes(html):
    """Apply all property detail fixes"""
    
    # Fix 1: Bathroom Full 2 -> 3
    # Find the bathroom full section and change the value
    html = re.sub(
        r'(<strong>\s*BATHROOM FULL\s*</strong>\s*<span>)\s*2\s*(</span>)',
        r'\g<1>3\g<2>',
        html,
        flags=re.IGNORECASE
    )
    print("1. Fixed Bathroom Full: 2 -> 3")
    
    # Fix 4: Garage Spaces 2 -> 3
    html = re.sub(
        r'(<strong>\s*Garage Spaces\s*</strong>\s*<span>)\s*2\s*(</span>)',
        r'\g<1>3\g<2>',
        html,
        flags=re.IGNORECASE
    )
    print("4. Fixed Garage Spaces: 2 -> 3")
    
    # Fix 5: Type - change from "Home" to "Like New Home"
    # This appears in the property details grid
    html = re.sub(
        r'(<strong>\s*Type\s*</strong>\s*<span>)\s*Home\s*(</span>)',
        r'\g<1>Like New Home\g<2>',
        html,
        flags=re.IGNORECASE
    )
    print("5. Fixed Type: Home -> Like New Home")
    
    # Fix 3: PLS # -> PRIVATE LISTING #
    html = html.replace('>PLS #<', '>PRIVATE LISTING #<')
    html = html.replace('>PLS#<', '>PRIVATE LISTING #<')
    print("3. Fixed label: PLS # -> PRIVATE LISTING #")
    
    # Fix 2 & 6: Add School District and Neighborhood rows
    # Find the PLS # (now PRIVATE LISTING #) row and add new rows after it
    
    # First, let's add School District BEFORE the PRIVATE LISTING # row
    # And Neighborhood AFTER it
    
    # Find the Status row and add School District after it
    status_pattern = r'(<li class="body-color">\s*<strong>\s*Status\s*</strong>\s*<span>[^<]*</span>\s*</li>)'
    school_district_row = '''<li class="body-color">
                            <strong>School District</strong>
                            <span>Boerne ISD</span>
                        </li>'''
    
    # Insert School District after Status
    html = re.sub(
        status_pattern,
        r'\1\n                        ' + school_district_row,
        html,
        flags=re.IGNORECASE | re.DOTALL
    )
    print("2. Added School District: Boerne ISD")
    
    # Find the PRIVATE LISTING # row and add Neighborhood after it
    pls_pattern = r'(<li class="body-color">\s*<strong>\s*PRIVATE LISTING #\s*</strong>\s*<span>[^<]*</span>\s*</li>)'
    neighborhood_row = '''<li class="body-color">
                            <strong>Neighborhood</strong>
                            <span>Balcones Creek</span>
                        </li>'''
    
    html = re.sub(
        pls_pattern,
        r'\1\n                        ' + neighborhood_row,
        html,
        flags=re.IGNORECASE | re.DOTALL
    )
    print("6. Added Neighborhood: Balcones Creek")
    
    return html

def main():
    print("=== DOWNLOADING PRODUCTION PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    html = response.text
    print(f"Downloaded {len(html)} characters")
    
    print("\n=== APPLYING PROPERTY DETAILS FIXES ===")
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
    print("PROPERTY DETAILS FIXES COMPLETE!")
    print("")
    print("Changes applied:")
    print("  1. Bathroom Full: 3")
    print("  2. School District: Boerne ISD (NEW)")
    print("  3. PRIVATE LISTING # (was PLS #)")
    print("  4. Garage Spaces: 3")
    print("  5. Type: Like New Home")
    print("  6. Neighborhood: Balcones Creek (NEW)")
    print("="*60)

if __name__ == '__main__':
    main()

