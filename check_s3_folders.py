#!/usr/bin/env python3
"""Check what folders exist in S3 genie-pages"""
import boto3

s3 = boto3.Session(profile_name='genie-hub-active').client('s3', region_name='us-west-1')

# List all folders in genie-pages
result = s3.list_objects_v2(Bucket='genie-cloud', Prefix='genie-pages/', Delimiter='/')

print("Folders in genie-pages/:")
for prefix in result.get('CommonPrefixes', []):
    folder = prefix['Prefix']
    print(f"  {folder}")
    
    # Check when files were last modified in each folder
    files = s3.list_objects_v2(Bucket='genie-cloud', Prefix=folder, MaxKeys=5)
    for obj in files.get('Contents', [])[:3]:
        print(f"    - {obj['Key'].replace(folder, '')} (Modified: {obj['LastModified']})")

