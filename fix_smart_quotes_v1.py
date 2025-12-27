"""
Fix Smart Quotes Issue
Version: 1.0
Created: 12/25/2025
"""

import boto3

# Read the current fixed file
with open(r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-qa-fixed.html', 'r', encoding='utf-8') as f:
    html = f.read()

# Find and fix the smart apostrophe issue (U+2019 = right single quote)
before = html.count('\u2019')
html = html.replace('\u2019', "'")
after = html.count('\u2019')
print(f'Fixed smart apostrophes (U+2019): {before} -> {after}')

# Fix left single quote (U+2018)
before2 = html.count('\u2018')
html = html.replace('\u2018', "'")
print(f'Fixed left single quotes (U+2018): {before2}')

# Fix smart double quotes
html = html.replace('\u201c', '"')  # Left double quote
html = html.replace('\u201d', '"')  # Right double quote
print('Fixed smart double quotes')

# Save locally
with open(r'D:\Cursor\_SourceCode\stage.geniecloud\pls-10037-rebecca-qa-fixed-v2.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('Saved to pls-10037-rebecca-qa-fixed-v2.html')

# Deploy
session = boto3.Session(profile_name='genie-hub-active')
s3 = session.client('s3', region_name='us-west-1')
s3.put_object(
    Bucket='genie-cloud',
    Key='genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html',
    Body=html.encode('utf-8'),
    ContentType='text/html; charset=utf-8',
    CacheControl='max-age=0'
)
print('DEPLOYED!')
print('URL: https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html')

