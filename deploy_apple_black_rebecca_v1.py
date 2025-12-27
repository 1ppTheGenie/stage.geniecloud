"""
Deploy Apple Black Version of Rebecca Place to S3
"""
import boto3

# S3 Configuration
BUCKET_NAME = 'genie-cloud'
CANONICAL_S3_KEY = 'genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
LEGACY_S3_KEY = 'genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html'
LOCAL_FILE = 'pls_apple_black_preview_v1.html'

def deploy_to_s3():
    print("=" * 60)
    print("DEPLOYING APPLE BLACK REBECCA PLACE TO S3")
    print("=" * 60)
    
    # Read the local file
    with open(LOCAL_FILE, 'r', encoding='utf-8') as f:
        html_content = f.read()
    
    print(f"\nFile size: {len(html_content)} bytes")
    
    # Upload to S3
    session = boto3.Session(profile_name='genie-hub-active')
    s3 = session.client('s3', region_name='us-west-1')
    
    # Deploy to canonical path
    print(f"\nUploading to: s3://{BUCKET_NAME}/{CANONICAL_S3_KEY}")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=CANONICAL_S3_KEY,
        Body=html_content,
        ContentType='text/html'
    )
    print("   Done!")
    
    # Deploy to legacy path
    print(f"\nUploading to: s3://{BUCKET_NAME}/{LEGACY_S3_KEY}")
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=LEGACY_S3_KEY,
        Body=html_content,
        ContentType='text/html'
    )
    print("   Done!")
    
    print("\n" + "=" * 60)
    print("DEPLOYMENT COMPLETE!")
    print("=" * 60)
    print("\nLive URLs (may need CloudFront cache clear):")
    print(f"  https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html")
    print(f"  https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/lc-hollywood/index.html")
    print("\nDirect S3 URL (no cache):")
    print(f"  https://genie-cloud.s3.us-west-1.amazonaws.com/{CANONICAL_S3_KEY}")

if __name__ == "__main__":
    deploy_to_s3()

