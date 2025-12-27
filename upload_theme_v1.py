"""
Upload Apple Black Theme to S3
"""
import boto3

# S3 Configuration
BUCKET_NAME = 'genie-cloud'
S3_KEY = '_assets/themes/apple-black.css'
LOCAL_FILE = 'themes/apple-black.css'

def upload_theme():
    """Upload the theme CSS to S3"""
    print(f"Uploading {LOCAL_FILE} to s3://{BUCKET_NAME}/{S3_KEY}")
    
    # Use the genie-hub-active profile
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Read the CSS file
    with open(LOCAL_FILE, 'r', encoding='utf-8') as f:
        css_content = f.read()
    
    # Upload with proper content type
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=S3_KEY,
        Body=css_content,
        ContentType='text/css'
    )
    
    print(f"✅ Upload complete!")
    print(f"Theme URL: https://cloud.thegenie.ai/_assets/themes/apple-black.css")

if __name__ == "__main__":
    upload_theme()

