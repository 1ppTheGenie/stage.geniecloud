"""
Fix Brochure Button to Scroll to Contact Form
Version: 1.0
Created: 12/25/2025
Author: Cursor AI

This script:
1. Downloads current production page
2. Changes "Request Property Brochure" to scroll to the contact form
3. Also fixes any remaining encoding issues
4. Redeploys to production

CHANGE LOG:
v1.0 - 12/25/2025 - Brochure button scrolls to contact form, prefer text contact
"""

import requests
import boto3
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LOCAL_PATH = r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-final-mvp.html'

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
    # Fix smart apostrophes
    html = html.replace('\u2019', "'")
    html = html.replace("'", "'")
    html = html.replace('\u2018', "'")
    html = html.replace("'", "'")
    
    # Fix smart quotes
    html = html.replace('\u201c', '"')
    html = html.replace('\u201d', '"')
    html = html.replace('"', '"')
    html = html.replace('"', '"')
    
    # Fix dashes
    html = html.replace('\u2014', '--')
    html = html.replace('—', '--')
    html = html.replace('\u2013', '-')
    html = html.replace('–', '-')
    
    # Fix mojibake
    html = html.replace('â€™', "'")
    html = html.replace('â€˜', "'")
    html = html.replace('â€œ', '"')
    html = html.replace('â€', '"')
    html = html.replace('â€"', '--')
    
    # Fix A character issue
    html = re.sub(r'\u00c2\s*', '', html)
    html = re.sub(r'\u00c2', '', html)
    
    return html

def fix_brochure_button(html):
    """Change brochure button to scroll to contact form"""
    
    # The current brochure button with alert (from our previous fix)
    old_button = '<a class="pdf-btn" target="_blank" href="javascript:alert(\'Property brochure coming soon! Contact Steve Hundley for more information.\')" data-genie-tags="DownloadPropertyBrochure,ClickCta">'
    
    # New button that scrolls to contact section (about-section is the contact form)
    new_button = '<a class="pdf-btn" href="#about-section" data-genie-tags="DownloadPropertyBrochure,ClickCta,RequestBrochure">'
    
    if old_button in html:
        html = html.replace(old_button, new_button)
        print("Fixed brochure button (from alert version)")
    else:
        # Try the original empty href version
        old_button2 = '<a class="pdf-btn" target="_blank" href="" data-genie-tags="DownloadPropertyBrochure,ClickCta">'
        if old_button2 in html:
            html = html.replace(old_button2, new_button)
            print("Fixed brochure button (from empty href version)")
        else:
            print("WARNING: Could not find brochure button to fix")
    
    # The button text was already changed to "Request Property Brochure" - verify it's there
    if 'Request Property Brochure' in html:
        print("Button text already says 'Request Property Brochure'")
    elif 'Download Property Brochure' in html:
        html = html.replace('Download Property Brochure', 'Request Property Brochure')
        print("Changed button text to 'Request Property Brochure'")
    
    return html

def main():
    print("=== DOWNLOADING PRODUCTION PAGE ===")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    html = response.text
    print(f"Downloaded {len(html)} characters")
    
    print("\n=== FIXING BROCHURE BUTTON ===")
    html = fix_brochure_button(html)
    
    print("\n=== FIXING ENCODING ISSUES ===")
    html = fix_encoding(html)
    print("Encoding fixes applied")
    
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
    print("MVP FIX COMPLETE!")
    print("")
    print("'Request Property Brochure' now scrolls to contact form")
    print("(#about-section anchor)")
    print("")
    print("LIVE URLs:")
    print("  https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html")
    print("  https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html")
    print("="*60)

if __name__ == '__main__':
    main()

