/* prettier-ignore */
import { S3Client, DeleteObjectCommand, ListObjectsV2Command, GetObjectCommand, GetObjectTaggingCommand, PutObjectCommand, HeadObjectCommand, CopyObjectCommand, PutObjectRetentionCommand } from '@aws-sdk/client-s3';
import {
    CloudFrontClient,
    CreateInvalidationCommand
} from '@aws-sdk/client-cloudfront';
import { SQSClient, SendMessageCommand } from '@aws-sdk/client-sqs';
import { Readable } from 'stream';

export const BUCKET = process.env.BUCKET ?? 'genie-hub-2';
const REGION = process.env.REGION ?? 'eu-west-2';

const SQS_QUEUE =
    process.env.SQS_QUEUE ??
    'https://sqs.eu-west-2.amazonaws.com/584678469437/genie-cloud';

// Set up the S3 client
const s3Client = new S3Client({ region: REGION });
const sqs = new SQSClient({ region: REGION });

export const streamS3Object = async (key, bucket = null) => {
    try {
        const command = new GetObjectCommand({
            Bucket: bucket ?? BUCKET,
            Key: key
        });

        const { Body } = await s3Client.send(command);
        
        if (Body instanceof Readable) {
            return Body;
        } else {
            // If Body is not a stream, convert it to one
            const stream = new Readable();
            stream.push(await Body.transformToByteArray());
            stream.push(null);
            return stream;
        }
    } catch (err) {
        console.error(`Error streaming object ${key}:`, err);
        throw err;
    }
};

// Helper function to read a stream chunk by chunk
export const readStream = async function* (stream) {
    for await (const chunk of stream) {
        yield chunk.toString('utf-8');
    }
};

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
        MetadataDirective: 'REPLACE'
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

export const searchS3ByPrefix = async (prefix, suffix = null, bucket = null) => {
    try {
        let allMatches = [];
        let isTruncated = true;
        let nextContinuationToken = null;

        while (isTruncated) {
            const listParams = {
                Bucket: bucket ?? BUCKET,
                Prefix: prefix,
                ContinuationToken: nextContinuationToken
            };

            const response = await s3Client.send(
                new ListObjectsV2Command(listParams)
            );

            let contents = response.Contents || [];
            
            // If a suffix is provided, filter the results
            if (suffix) {
                contents = contents.filter(item => item.Key.endsWith(suffix));
            }

            allMatches = allMatches.concat(contents);
            isTruncated = response.IsTruncated;
            nextContinuationToken = response.NextContinuationToken;
        }

        return allMatches;
    } catch (err) {
        console.error('Error in searchS3ByPrefix:', err);
        throw err;
    }
};

export const listS3Folder = async (
    folderPath = '',
    justContents = true,
    token = null,
    bucket = null
) => {
    try {
        let allContents = [];
        let isTruncated = true;
        let nextContinuationToken = null;

        while (isTruncated) {
            const listParams = {
                Bucket: bucket ?? BUCKET,
                Prefix: folderPath,
                ContinuationToken: nextContinuationToken
            };

            const response = await s3Client.send(
                new ListObjectsV2Command(listParams)
            );

            allContents = allContents.concat(response.Contents || []);
            isTruncated = response.IsTruncated;
            nextContinuationToken = response.NextContinuationToken;
        }

        return justContents ? allContents : { Contents: allContents };
    } catch (err) {
        console.error('Error in listS3Folder:', err);
        throw err;
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

export const invalidateCache = async paths => {
    if (process.env.CF_DISTRIBUTION_ID) {
        try {
            const client = new CloudFrontClient({ region: REGION });

            await client.send(
                new CreateInvalidationCommand({
                    DistributionId: process.env.CF_DISTRIBUTION_ID,
                    InvalidationBatch: {
                        CallerReference: Date.now().toString(),
                        Paths: {
                            Quantity: paths.length,
                            Items: paths
                        }
                    }
                })
            );
        } catch (err) {
            console.error('Error invalidating cache:', err);
        }
    }
};
