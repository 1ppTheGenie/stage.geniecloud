"""
ROLLBACK: Restore settings.json to US Lambda endpoint

This restores the original US Lambda endpoint.

Version: 1.0
Created: 12/28/2025
Author: Cursor AI
"""
import boto3
import os

BUCKET_NAME = 'genie-cloud'
S3_KEY = 'settings.json'

# Original US Lambda endpoint
ORIGINAL_SETTINGS = '''{
	"endpoint": "https://hlstwykrw3gkmc6lx4zhe534ma0kuumg.lambda-url.us-west-1.on.aws/"
}
'''

def rollback_settings():
    print("=" * 70)
    print("ROLLBACK: Restoring settings.json to US Lambda")
    print("=" * 70)
    
    print(f"\nRestoring content:")
    print(ORIGINAL_SETTINGS)
    
    # Create S3 client with the genie-hub-active profile
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Upload original settings
    print("Uploading original settings.json...")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=S3_KEY,
        Body=ORIGINAL_SETTINGS,
        ContentType='application/json',
        CacheControl='max-age=60'
    )
    
    print("\n" + "=" * 70)
    print("ROLLBACK COMPLETE")
    print("=" * 70)
    
    print("\n[SUCCESS] settings.json restored to US Lambda endpoint!")
    print(f"   URL: https://cloud.thegenie.ai/{S3_KEY}")

if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    rollback_settings()

