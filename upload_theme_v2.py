"""
Upload Apple Black Theme v2 to S3
v1 remains intact, this creates a new v2 file
"""
import boto3

# S3 Configuration
BUCKET_NAME = 'genie-cloud'
S3_KEY = '_assets/themes/apple-black-v2.css'
LOCAL_FILE = 'themes/apple-black-v2.css'

def upload_theme():
    print("=" * 60)
    print("UPLOADING APPLE BLACK v2 THEME")
    print("=" * 60)
    print(f"\nLocal file: {LOCAL_FILE}")
    print(f"S3 destination: s3://{BUCKET_NAME}/{S3_KEY}")
    print("\nNote: v1 (apple-black.css) remains UNTOUCHED")
    
    # Use the genie-hub-active profile
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Read the CSS file
    with open(LOCAL_FILE, 'r', encoding='utf-8') as f:
        css_content = f.read()
    
    print(f"File size: {len(css_content)} bytes")
    
    # Upload with proper content type
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=S3_KEY,
        Body=css_content,
        ContentType='text/css'
    )
    
    print("\n" + "=" * 60)
    print("UPLOAD COMPLETE!")
    print("=" * 60)
    print(f"\nTheme v2 URL: https://cloud.thegenie.ai/{S3_KEY}")
    print("\nv1 still at: https://cloud.thegenie.ai/_assets/themes/apple-black.css")

if __name__ == "__main__":
    upload_theme()

