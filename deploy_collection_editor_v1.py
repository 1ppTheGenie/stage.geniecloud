"""
Deploy Collection Editor to S3 (genie-cloud bucket)

This script uploads the built collection-editor from:
  public/genie-tools/collection-editor/
to:
  s3://genie-cloud/genie-tools/collection-editor/

Version: 1.0
Created: 12/28/2025
Author: Cursor AI
"""
import boto3
import os
import mimetypes

BUCKET_NAME = 'genie-cloud'
SOURCE_DIR = 'public/genie-tools/collection-editor'
S3_PREFIX = 'genie-tools/collection-editor'

# MIME type mappings for web assets
MIME_TYPES = {
    '.html': 'text/html',
    '.css': 'text/css',
    '.js': 'application/javascript',
    '.json': 'application/json',
    '.ico': 'image/x-icon',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.svg': 'image/svg+xml',
    '.woff': 'font/woff',
    '.woff2': 'font/woff2',
    '.ttf': 'font/ttf',
    '.map': 'application/json'
}

def get_content_type(filepath):
    """Get the content type for a file based on its extension."""
    ext = os.path.splitext(filepath)[1].lower()
    return MIME_TYPES.get(ext, 'application/octet-stream')

def deploy_collection_editor():
    print("=" * 70)
    print("DEPLOYING COLLECTION EDITOR TO S3")
    print("=" * 70)
    
    # Create S3 client with the genie-hub-active profile
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Walk through all files in the source directory
    uploaded_files = []
    
    for root, dirs, files in os.walk(SOURCE_DIR):
        for filename in files:
            local_path = os.path.join(root, filename)
            
            # Calculate S3 key (relative path from source dir)
            relative_path = os.path.relpath(local_path, SOURCE_DIR)
            s3_key = f"{S3_PREFIX}/{relative_path}".replace('\\', '/')
            
            # Get content type
            content_type = get_content_type(filename)
            
            print(f"  Uploading: {relative_path}")
            print(f"    -> s3://{BUCKET_NAME}/{s3_key}")
            print(f"    -> Content-Type: {content_type}")
            
            with open(local_path, 'rb') as f:
                content = f.read()
            
            s3.put_object(
                Bucket=BUCKET_NAME,
                Key=s3_key,
                Body=content,
                ContentType=content_type,
                CacheControl='max-age=3600'
            )
            
            uploaded_files.append(s3_key)
    
    print("\n" + "=" * 70)
    print(f"DEPLOYMENT COMPLETE - {len(uploaded_files)} files uploaded")
    print("=" * 70)
    
    print("\n[SUCCESS] Collection Editor now available at:")
    print(f"   https://cloud.thegenie.ai/{S3_PREFIX}/")
    print(f"   https://cloud.thegenie.ai/{S3_PREFIX}/index.html")
    
    print("\n[FILES] Files uploaded:")
    for f in uploaded_files:
        print(f"   - {f}")

if __name__ == "__main__":
    # Change to the script's directory
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    deploy_collection_editor()

