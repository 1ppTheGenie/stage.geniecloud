"""
Deploy settings.json to S3 (genie-cloud bucket)

This updates the API endpoint used by genie-tools apps.

CHANGE: Switching from US Lambda to EU Lambda to access collections
OLD: https://hlstwykrw3gkmc6lx4zhe534ma0kuumg.lambda-url.us-west-1.on.aws/
NEW: https://dqohcd54xpkdwnueu2wn2nkxge0aboae.lambda-url.eu-west-2.on.aws/

Version: 1.0
Created: 12/28/2025
Author: Cursor AI

ROLLBACK: Run deploy_settings_json_rollback_v1.py to restore US endpoint
"""
import boto3
import os

BUCKET_NAME = 'genie-cloud'
S3_KEY = 'settings.json'
LOCAL_FILE = 'public/settings.json'

def deploy_settings():
    print("=" * 70)
    print("DEPLOYING settings.json TO S3")
    print("=" * 70)
    
    # Read the new settings
    with open(LOCAL_FILE, 'r') as f:
        content = f.read()
    
    print(f"\nNew settings.json content:")
    print(content)
    
    # Create S3 client with the genie-hub-active profile
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # First, backup the current settings
    print("\n1. Backing up current settings.json...")
    try:
        current = s3.get_object(Bucket=BUCKET_NAME, Key=S3_KEY)
        backup_content = current['Body'].read().decode('utf-8')
        print(f"   Current content: {backup_content}")
        
        # Save backup locally
        with open('settings_backup_us_lambda.json', 'w') as f:
            f.write(backup_content)
        print(f"   Saved backup to: settings_backup_us_lambda.json")
    except Exception as e:
        print(f"   Warning: Could not backup current settings: {e}")
    
    # Upload new settings
    print("\n2. Uploading new settings.json...")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=S3_KEY,
        Body=content,
        ContentType='application/json',
        CacheControl='max-age=60'  # Short cache for quick updates
    )
    
    print("\n" + "=" * 70)
    print("DEPLOYMENT COMPLETE")
    print("=" * 70)
    
    print("\n[SUCCESS] settings.json updated!")
    print(f"   URL: https://cloud.thegenie.ai/{S3_KEY}")
    print("\n[NEXT] Test the Collection Editor:")
    print("   https://cloud.thegenie.ai/genie-tools/collection-editor/")
    print("\n[ROLLBACK] To restore US endpoint, run:")
    print("   python deploy_settings_json_rollback_v1.py")

if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    deploy_settings()

