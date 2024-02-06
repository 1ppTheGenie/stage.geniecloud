import { SQSClient, SendMessageCommand } from '@aws-sdk/client-sqs';
import {
    S3Client,
    DeleteObjectCommand,
    ListObjectsV2Command,
    GetObjectCommand,
    GetObjectTaggingCommand,
    PutObjectCommand,
    HeadObjectCommand,
    CopyObjectCommand,
    PutObjectRetentionCommand
} from '@aws-sdk/client-s3';

export const BUCKET = process.env.BUCKET ?? 'genie-hub-2';
const REGION = process.env.REGION ?? 'eu-west-2';

const SQS_QUEUE =
    process.env.SQS_QUEUE ??
    'https://sqs.eu-west-2.amazonaws.com/584678469437/genie-cloud';

// Set up the S3 client
const s3Client = new S3Client({ region: REGION });
const sqs = new SQSClient({ region: REGION });

export const copyObject = async (
    sourceKey,
    destinationKey,
    bucket = null,
    ContentType = null,
    CacheControl = null
) => {
    const args = {
        Bucket: bucket ?? BUCKET,
        CopySource: `/${bucket ?? BUCKET}/${sourceKey}`,
        Key: destinationKey,
        CacheControl: CacheControl,
        ContentType: ContentType,
        MetadataDirective: "REPLACE"
    };

    return await s3Client.send(new CopyObjectCommand(args));
};

export const setS3Retention = async (Key, retainUntil, bucket = null) => {
    const args = {
        Bucket: bucket ?? BUCKET,
        Key,
        Retention: {
            Mode: 'GOVERNANCE',
            RetainUntilDate: retainUntil
        },
        BypassGovernanceRetention: true
    };

    return await s3Client.send(new PutObjectRetentionCommand(args));
};

export const listS3Folder = async (
    folderPath = '',
    justContents = true,
    token = null,
    bucket = null
) => {
    try {
        const listParams = {
            Bucket: bucket ?? BUCKET,
            Prefix: folderPath,
            ContinuationToken: token
        };

        const response = await s3Client.send(
            new ListObjectsV2Command(listParams)
        );

        return justContents ? response.Contents : response;
    } catch (err) {
        console.error('Error:', err);
    }
};

export const deleteObject = async (Key, Bucket = null) =>
    await s3Client.send(
        new DeleteObjectCommand({
            Bucket: Bucket || BUCKET,
            Key
        })
    );

export const headObject = async (key, since = null, bucket = null) => {
    try {
        const result = await s3Client.send(
            new HeadObjectCommand({
                Bucket: bucket ?? BUCKET,
                Key: key,
                IfModifiedSince: since
            })
        );

        return result;
    } catch (err) {
        if (err.name !== 'NotFound') {
            console.log('Error HeadObject:', err);
        }
    }
};

export const jsonFromS3 = async (key, since = null, bucket = null) => {
    bucket = bucket ?? BUCKET;
    try {
        const r = await fromS3(key, since, bucket);

        if (r) {
            return JSON.parse(r);
        }
    } catch (err) {
        console.log('Retrieve JSON: ', err);
    }
};

export const getTags = async (key, bucket = null) => {
    bucket = bucket ?? BUCKET;

    try {
        const r = await s3Client.send(
            new GetObjectTaggingCommand({
                Bucket: bucket,
                Key: key
            })
        );

        return r;
    } catch (err) {
        if (!err.Code == 'NoSuchKey') console.log('Retrieve TAGS: ', err);
    }
};

export const fromS3 = async (key, since = null, bucket = null) => {
    bucket = bucket ?? BUCKET;

    try {
        const buffer = Buffer.concat(
            await (
                await s3Client.send(
                    new GetObjectCommand({
                        Bucket: bucket,
                        Key: key,
                        IfModifiedSince: since
                    })
                )
            ).Body.toArray()
        );

        return buffer;
    } catch (err) {
        if (!err.Code == 'NoSuchKey') console.log('Retrieve JSON: ', err);
    }
};

export const toS3 = async (
    key,
    buffer,
    tags = null,
    mimeType = null,
    bucket = null,
    otherParams = {}
) => {
    if (tags && typeof tags == 'object') {
        tags = Object.keys(tags)
            .map(key => `${key}=${encodeURIComponent(tags[key])}`)
            .join('&');
    }

    try {
        const res = await s3Client.send(
            new PutObjectCommand({
                Bucket: bucket ?? BUCKET,
                Key: key,
                Body: buffer,
                ContentType: mimeType,
                Tagging: tags,
                ...otherParams
            })
        );

        return res.ETag;
    } catch (err) {
        console.log('S3 save err', err, key, tags);
    }
};

export const queueMsg = async (body, attributes) => {
    const sqsMessage = {
        QueueUrl: SQS_QUEUE,
        MessageAttributes: attributes,
        MessageBody: body
    };

    return await sqs.send(new SendMessageCommand(sqsMessage));
};
