"""
Restore Original Compass Theme to Production
This undoes the Apple Black deployment and restores compass dark theme
"""
import boto3

# S3 Configuration
BUCKET_NAME = 'genie-cloud'
CANONICAL_S3_KEY = 'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LEGACY_S3_KEY = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'

# Use the backup from before Apple Black changes
BACKUP_FILE = 'backups/2025-12-26_221300/pls_production_current_BACKUP.html'

def restore_production():
    print("=" * 60)
    print("RESTORING COMPASS THEME TO PRODUCTION")
    print("=" * 60)
    
    # Read the backup file (original compass version)
    with open(BACKUP_FILE, 'r', encoding='utf-8') as f:
        html_content = f.read()
    
    # Verify it's the compass version
    if 'compass dark' in html_content:
        print("\nVerified: Backup contains 'compass dark' theme")
    else:
        print("\nWARNING: Backup may not be original compass version!")
        return
    
    print(f"File size: {len(html_content)} bytes")
    
    # Upload to S3
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Restore canonical path
    print(f"\nRestoring: s3://{BUCKET_NAME}/{CANONICAL_S3_KEY}")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=CANONICAL_S3_KEY,
        Body=html_content,
        ContentType='text/html'
    )
    print("   Done!")
    
    # Restore legacy path
    print(f"\nRestoring: s3://{BUCKET_NAME}/{LEGACY_S3_KEY}")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=LEGACY_S3_KEY,
        Body=html_content,
        ContentType='text/html'
    )
    print("   Done!")
    
    print("\n" + "=" * 60)
    print("PRODUCTION RESTORED TO COMPASS DARK!")
    print("=" * 60)
    print("\nLive site now uses original compass dark theme.")
    print("Apple Black v2 development continues locally only.")

if __name__ == "__main__":
    restore_production()

