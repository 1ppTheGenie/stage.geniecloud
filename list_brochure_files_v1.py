"""List files in the Dainelle and PLS S3 folders"""
import boto3

BUCKET = 'genie-cloud'
REGION = 'us-west-1'
PROFILE = 'genie-hub-active'

session = boto3.Session(profile_name=PROFILE, region_name=REGION)
s3 = session.client('s3')

print("=== DAINELLE'S FOLDER ===")
response = s3.list_objects_v2(
    Bucket=BUCKET,
    Prefix='genie-pages/15a521b8-3fbf-4042-bce3-58e378cd9a52/'
)
if 'Contents' in response:
    for obj in response['Contents']:
        print(f"  {obj['Key']}")
else:
    print("  No files found")

print("\n=== PLS-10037-REBECCA FOLDER ===")
response = s3.list_objects_v2(
    Bucket=BUCKET,
    Prefix='genie-pages/pls-10037-rebecca-place/'
)
if 'Contents' in response:
    for obj in response['Contents']:
        print(f"  {obj['Key']}")
else:
    print("  No files found")

