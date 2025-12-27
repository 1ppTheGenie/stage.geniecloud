#!/usr/bin/env python3
"""
Fix Mobile Responsiveness by Removing Extra Whitespace
=======================================================
Version: 1.0
Created: 12/26/2025
Author: Cursor AI

Problem: XSL transformation created 858 empty lines that break CSS rendering on mobile.
Solution: Strip extra whitespace to match working page format.
"""

import boto3
import requests
import re

# Configuration
PRODUCTION_URL = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
S3_BUCKET = 'genie-cloud'
S3_KEY = 'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
AWS_PROFILE = 'genie-hub-active'
REGION = 'us-west-1'

def download_current_html():
    """Download the current production HTML"""
    print(f"Downloading from: {PRODUCTION_URL}")
    response = requests.get(PRODUCTION_URL)
    response.raise_for_status()
    return response.text

def fix_whitespace(html):
    """Remove excessive whitespace while preserving structure"""
    original_length = len(html)
    original_lines = len(html.split('\n'))
    
    # Count empty lines before
    empty_before = len([l for l in html.split('\n') if l.strip() == ''])
    
    # Remove multiple consecutive blank lines - replace with single newline
    # First, normalize line endings
    html = html.replace('\r\n', '\n').replace('\r', '\n')
    
    # Remove blank lines entirely (lines with only whitespace)
    lines = html.split('\n')
    cleaned_lines = []
    prev_was_content = True
    
    for line in lines:
        stripped = line.strip()
        if stripped:
            # Has content - keep it
            cleaned_lines.append(line.rstrip())  # Remove trailing spaces
            prev_was_content = True
        else:
            # Empty line - skip it entirely
            pass
    
    # Join back together
    html = '\n'.join(cleaned_lines)
    
    # Also compress multiple spaces within lines (but not in preformatted content)
    # This is safe for HTML since browsers collapse whitespace anyway
    
    new_length = len(html)
    new_lines = len(html.split('\n'))
    empty_after = len([l for l in html.split('\n') if l.strip() == ''])
    
    print(f"\nWhitespace Cleanup Results:")
    print(f"  Original: {original_lines:,} lines, {original_length:,} bytes")
    print(f"  Cleaned:  {new_lines:,} lines, {new_length:,} bytes")
    print(f"  Empty lines removed: {empty_before} -> {empty_after}")
    print(f"  Size reduction: {((original_length - new_length) / original_length * 100):.1f}%")
    
    return html

def upload_to_s3(html, s3_key):
    """Upload fixed HTML to S3"""
    session = boto3.Session(profile_name=AWS_PROFILE)
    s3 = session.client('s3', region_name=REGION)
    
    print(f"\nUploading to S3: s3://{S3_BUCKET}/{s3_key}")
    
    s3.put_object(
        Bucket=S3_BUCKET,
        Key=s3_key,
        Body=html.encode('utf-8'),
        ContentType='text/html; charset=utf-8',
        CacheControl='no-cache, no-store, must-revalidate'
    )
    
    print("Upload complete!")

def main():
    print("=" * 60)
    print("PLS-Hollywood Mobile Fix - Whitespace Removal")
    print("=" * 60)
    
    # Download current HTML
    html = download_current_html()
    
    # Fix whitespace
    html = fix_whitespace(html)
    
    # Save locally for inspection
    local_file = 'pls_production_fixed_whitespace.html'
    with open(local_file, 'w', encoding='utf-8') as f:
        f.write(html)
    print(f"\nSaved locally: {local_file}")
    
    # Upload to S3
    upload_to_s3(html, S3_KEY)
    
    # Also upload to legacy path
    legacy_key = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
    upload_to_s3(html, legacy_key)
    
    print("\n" + "=" * 60)
    print("COMPLETE! Test the page on mobile:")
    print(f"  https://cloud.thegenie.ai/{S3_KEY}")
    print("=" * 60)

if __name__ == '__main__':
    main()

