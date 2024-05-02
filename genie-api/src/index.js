'use strict';
import sharp from 'sharp';
import { Readable } from 'stream';

import { DateTime } from 'luxon';
import { randomUUID } from 'crypto';
import { basename } from 'path';
import pkg from 'jstoxml';
const { toXML } = pkg;

// prettier-ignore
import {propertySurroundingAreas, getAreaBoundary, getUser, impersonater, getListing, areaName } from "./genieAI.js";
// prettier-ignore
import { userSetting, embedsAPI, cloudHubAPI,getRenderJSON, getCollection, setRenderDefaults, genieGlobals, queueMsg, generateQR, areaFromMlsNumber, getDimensions, assetSetting, getAsset, preCallGenieAPIs } from "./utils/index.js";
// prettier-ignore
import { listS3Folder, toS3, copyObject, headObject, jsonFromS3, fromS3, BUCKET, deleteObject, buildVersion } from "./utils/index.js";


const RENDER_VERSION = 100;

export const JSON_MIME = 'application/json';
export const TXT_MIME = 'text/plain';

export const api = async event => {
    let routes = [],
        routeParams = [];

    let response = {
        statusCode: 200,
        body: { success: false },
        headers: {
            'Content-Type': 'application/json'
        }
    };

    if (event.Records) {
        for (const record of event.Records) {
            if (record.eventSource == 'aws:sqs') {
                switch (record.body) {
                    case 'clear-cache':
                        let tempParams = {};
                        routes.push('/clear-cache');

                        Object.keys(record.messageAttributes).map(key => {
                            if (
                                [
                                    'tags',
                                    'prefixes',
                                    'hosts',
                                    'renderId'
                                ].includes(key)
                            ) {
                                tempParams[key] =
                                    record.messageAttributes[key].dataType ==
                                    'String'
                                        ? record.messageAttributes[key]
                                              .stringValue
                                        : '';
                            }
                        });
                        routeParams.push(tempParams);
                        break;

                    case 'prepare':
                        routes.push('/prepare');

                        const processKey = `_processing/${record.messageAttributes.renderId.stringValue}/render.json`;

                        let s3Params = await jsonFromS3(processKey);
                        if (s3Params) {
                            Object.keys(record.messageAttributes).map(key => {
                                if (key !== 'renderId') {
                                    if (key == 'override') {
                                        const override = JSON.parse(
                                            record.messageAttributes['override']
                                                .stringValue
                                        );

                                        s3Params = {
                                            ...s3Params,
                                            ...override
                                        };

                                        if (override.areaId) {
                                            s3Params.areaIds = [
                                                override.areaId
                                            ];
                                        }
                                    } else {
                                        s3Params[key] =
                                            record.messageAttributes[key]
                                                .dataType == 'String'
                                                ? record.messageAttributes[key]
                                                      .stringValue
                                                : '';
                                    }
                                }
                            });

                            routeParams.push(s3Params);
                        } else {
                            console.log(`Failed to get ${processKey}`);
                        }
                        break;

                    default:
                        break;
                }
            } else if (record.eventSource == 'aws:s3') {
                if (record.s3.object.key.endsWith('prep.json')) {
                    routes.push('/process');

                    let s3Params = await fromS3(record.s3.object.key).then(
                        buffer =>
                            buffer && buffer.length > 0
                                ? JSON.parse(buffer)
                                : null
                    );
                    routeParams.push({
                        ...s3Params,
                        sourceKey: record.s3.object.key
                    });
                }
            }
        }
    } else if (event.rawPath) {
        routes.push(event.rawPath);
        if (event.queryStringParameters) {
            routeParams.push(event.queryStringParameters);
        } else {
            routeParams.push(JSON.parse(event.body ?? '{}'));
        }
    }

    for (let i = 0; i < routes.length; i++) {
        const route = routes[i];
        let params = routeParams[i];

        if (params) {
            try {
                if (params?.impersonaterId)
                    impersonater.id = params.impersonaterId;

                if (route.startsWith('/genie-embed')) {
                    response.body = await embedsAPI(
                        route.replace('/genie-embed/v2/', ''),
                        params
                    );
                } else if (route.startsWith('/genie-admin')) {
                    response.body = await cloudHubAPI(
                        route.replace('/genie-admin/v2/', ''),
                        params
                    );
                } else {
                    switch (route) {
                        case '/build-version':
                            response.body = {
                                buildVersion: await buildVersion()
                            };
                            break;

                        case '/test':
                            console.log(params);
                            response.body = await propertySurroundingAreas(
                                params.mlsNumber,
                                params.mlsId ?? 0,
                                params.userId,
                                null,
                                null,
                                true
                            );
                            break;

                        case '/thumbnail':
                            if (params.url) {
                                if (params.width) {
                                    params.width = parseInt(params.width);
                                } else {
                                    params.width =
                                        typeof params.height == 'undefined'
                                            ? 300
                                            : null;
                                }

                                if (typeof params.height != 'undefined') {
                                    params.height = parseInt(params.height);
                                }

                                try {
                                    const image = await fetch(params.url);
                                    if (image.ok) {
                                        // Create a readable stream from the response body
                                        const imageBuffer =
                                            await image.arrayBuffer();
                                        const bytes = new Uint8Array(
                                            imageBuffer
                                        );
                                        const imageStream = new Readable();
                                        imageStream.push(bytes);
                                        imageStream.push(null);

                                        // Resize the image using sharp
                                        const resizedImage = imageStream.pipe(
                                            sharp()
                                                .resize({
                                                    width: params.width,
                                                    height: params.height
                                                })
                                                .webp({
                                                    effort: 3,
                                                    quality:
                                                        params.quality ?? 90
                                                })
                                        );

                                        // Convert the resized image to a buffer
                                        const resizedImageBuffer =
                                            await resizedImage.toBuffer();

                                        response = {
                                            statusCode: 200,
                                            headers: {
                                                'Content-Type': 'image/webp'
                                            },
                                            isBase64Encoded: true,
                                            body: resizedImageBuffer.toString(
                                                'base64'
                                            )
                                        };
                                    } else {
                                        response.body = {
                                            success: false,
                                            error: `Failed to fetch image: HTTP status ${image.status}`
                                        };
                                    }
                                } catch (error) {
                                    response.body = {
                                        success: false,
                                        error: `Error: ${error.message}`
                                    };
                                }
                            } else {
                                response.body = {
                                    success: false,
                                    error: '`url` is a required parameter'
                                };
                            }
                            break;

                        case '/make-qrcode':
                            const qr = await generateQR();
                            response.body = { success: true, ...qr };
                            break;

                        /*
                        case '/clear-cache':
                            if (CLOUDFLARE_KEY) {
                                const prefixes = [];

                                if (params.renderId) {
                                    const host =
                                        genieGlobals.GENIE_HOST.replace(
                                            'https://',
                                            ''
                                        );

                                    prefixes.push(
                                        `${host}genie-collection/${params.renderId}`
                                    );
                                    prefixes.push(
                                        `${host}genie-pages/${params.renderId}`
                                    );
                                    prefixes.push(
                                        `${host}genie-files/${params.renderId}`
                                    );
                                }

                                if (prefixes.length > 0) {
                                    const options = {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json',
                                            'X-Auth-Key': CLOUDFLARE_KEY
                                        },
                                        body: `{"prefixes": ["${prefixes}"}`
                                    };

                                    const r = await fetch(
                                        'https://api.cloudflare.com/client/v4/zones/identifier/purge_cache',
                                        options
                                    );
                                }
                            }

                            break;
*/
                        case '/log':
                            if (params.renderId && params.assetId) {
                                await toS3(
                                    `genie-pages/${params.renderId}/${params.assetId}/access.json`,
                                    Buffer.from(
                                        JSON.stringify({ accessed: Date.now() })
                                    ),
                                    null,
                                    JSON_MIME
                                );

                                const json = await jsonFromS3(
                                    `_processing/${params.renderId}}/render.json`
                                );
                                if (json.mlsNumber) {
                                    const updated = await mlsListingLastUpdate({
                                        mlsId: json.mlsId,
                                        mlsNumber: json.mlsNumber,
                                        userId: json.userId
                                    });

                                    console.log(updated.key); // updated.key is UTC
                                    // ToDo if update.key > render timestamp of index.html file, then trigger re-render
                                }

                                response.body = {
                                    success: true,
                                    renderId: params.renderId
                                };
                            }
                            break;
                        /*case '/change-retention':
                            if (!params.s3Key || !params.keepFor) {
                                response.body = {
                                    success: false,
                                    error: 's3Key are keepFor are required parameters'
                                };
                            } else {
                                const r = await setS3Retention(
                                    `_processing/${params.s3Key}`,
                                    new Date(
                                        Date.now() +
                                            WEEK_IN_MILLISECONDS *
                                                params.keepFor
                                    )
                                );
                                response.body = {
                                    params,
                                    success: true,
                                    result: r
                                };
                            }
                            break;
*/
                        case '/refresh-renders':
                            // Automated update of landing pages so that they don't go stale
                            let result = [];
                            let isTruncated = true;
                            let continuationToken = null;

                            while (isTruncated) {
                                const r = await listS3Folder(
                                    'genie-pages',
                                    false,
                                    continuationToken
                                );

                                try {
                                    await Promise.all(
                                        r.Contents.map(async item => {
                                            if (item.Key.endsWith('html')) {
                                                const parts =
                                                    item.Key.split('/');
                                                const renderId = parts[1];
                                                parts.pop(); // remove index.html
                                                const asset = parts.pop(); // Get asset name
                                                try {
                                                    const renderPath = `_processing/${renderId}/render.json`;
                                                    const renderExists =
                                                        await headObject(
                                                            renderPath
                                                        );
                                                    if (
                                                        renderExists?.ContentType ==
                                                        'application/json'
                                                    ) {
                                                        try {
                                                            /*
                                                            const tags =
                                                                await getTags(
                                                                    item.Key
                                                                );
                                                                */

                                                            const p = {
                                                                asset: `landing-pages/${asset}`,
                                                                overrideKey:
                                                                    item.Key,
                                                                collection: null
                                                            };
                                                            result.push(p);

                                                            return await reRender(
                                                                renderId,
                                                                p
                                                            );
                                                        } catch {}
                                                    }
                                                } catch (err) {
                                                    console.log('fail', err);
                                                }
                                            }
                                        })
                                    );

                                    isTruncated = r.IsTruncated;
                                    continuationToken = r.NextContinuationToken;
                                } catch (err) {
                                    console.error('refresh Error', err);
                                    break;
                                }
                            }
                            response.body = result;
                            break;

                        case '/re-render':
                            if (params.renderId) {
                                try {
                                    const r = await reRender(params.renderId, {
                                        ...params,
                                        skipCache: true
                                    });

                                    if ( r ) {
                                        await toS3(
                                            `_lookup/re-render/${params.renderId}`,
                                            Buffer.from( '@' ),
                                            null,
                                            TXT_MIME
                                        );

                                        response.body.success = true;
                                        response.body.msg = `${params.renderId} re-render under way`;

                                        if (Object.keys(params).length > 1) {
                                            response.body.msg +=
                                                ' (with override params)';
                                        }
                                    }

                                    // Get CloudFlare to empty itself
                                    await queueMsg('clear-cache', {
                                        renderId: {
                                            DataType: 'String',
                                            StringValue: params.renderId
                                        }
                                    });
                                } catch (err) {
                                    response.body.success = false;
                                    response.body.msg = `Error: ${err.message}`;
                                }
                            } else if (
                                params.assetId ||
                                params.userId ||
                                params.mlsNumber ||
                                params.areaId
                            ) {
                                let reRenders = [];

                                const r = await listS3Folder('_processing');
                                await Promise.all(
                                    r.map(async t => {
                                        if (
                                            t.Key.endsWith('render.json') &&
                                            t.Size > 0
                                        ) {
                                            const json = await jsonFromS3(
                                                t.Key
                                            );

                                            // Rerenders based on asset don't distinguish on user/area/mlsNumber basis
                                            if (params.assetId) {
                                                //ToDo
                                            } else if (
                                                // ToDo mlsId must match as well as as mlsNumber
                                                (!params.userId ||
                                                    params.userId ==
                                                        json.userId) &&
                                                (!params.mlsNumber ||
                                                    params.mlsNumber ==
                                                        json.mlsNumber) &&
                                                (!params.areaId ||
                                                    json.areaIds.includes(
                                                        params.areaId
                                                    ))
                                            ) {
                                                // ToDo Consider skipping collections that are single assets BUT NOT landing pages

                                                // ToDo? And access.json updates in last N hours/days?

                                                //Rerender: key will be `_processing/{renderId}/render.json`
                                                reRenders.push(
                                                    t.Key.split('/')[1]
                                                );
                                            }
                                        }
                                    })
                                );

                                if (reRenders.length > 0) {
                                    reRenders = reRenders.filter(
                                        (value, index, array) =>
                                            array.indexOf(value) === index
                                    );

                                    for (const index in reRenders) {
                                        await reRender(reRenders[index], {
                                            ...params,
                                            skipCache: true
                                        } );
                                        
                                        await toS3(
                                            `_lookup/re-render/${reRenders[index]}`,
                                            Buffer.from( '@' ),
                                            null,
                                            TXT_MIME
                                        );
                                    }

                                    response.body.success = true;
                                    response.body.msg = `${reRenders.length} re-renders underway`;
                                    response.body.data = reRenders;
                                }
                                break;
                            } else {
                                throw new Error(
                                    '[renderId] or [userId] or [mlsNumber] is required for a re-render'
                                );
                            }
                            break;

                        case '/process':
                            if (params) {
                                const r = await processAsset(params);

                                if (r) {
                                    let { sourceKey, ...reducedParams } =
                                        params;

                                    await toS3(
                                        sourceKey.replace('-prep.', '-xslt.'),
                                        Buffer.from(
                                            JSON.stringify({
                                                ...reducedParams,
                                                ...r
                                            })
                                        ),
                                        { 'Genie-Delete': true },
                                        JSON_MIME
                                    );

                                    await deleteObject(sourceKey);
                                }
                            }

                            break;

                        case '/prepare':
                            if (params.collection) {
                                const collection = await getCollection(
                                    params.collection
                                );

                                if (collection) {
                                    // Do the template first
                                    await prepareAsset(
                                        `collections/${collection.template}`,
                                        {
                                            ...params,
                                            asset: `collections/${collection.template}`,
                                            size: 'Landing Page',
                                            isCollectionTemplate: true
                                        }
                                    );

                                    await Promise.all(
                                        collection.sections.map(
                                            async section => {
                                                await Promise.all(
                                                    section.assets.map(
                                                        async asset => {
                                                            const assetParams =
                                                                {
                                                                    ...params,
                                                                    asset: asset.asset,
                                                                    size: asset.size,
                                                                    lpo: asset.lpo,
                                                                    qrDestination:
                                                                        asset.qrDestination,
                                                                    qrUrl: asset.qrUrl
                                                                };

                                                            return await prepareAsset(
                                                                asset.asset,
                                                                assetParams
                                                            );
                                                        }
                                                    )
                                                );
                                            }
                                        )
                                    );
                                }
                            } else if (params.assets) {
                                await Promise.all(
                                    params.assets.map(async asset => {
                                        return await prepareAsset(
                                            asset,
                                            params
                                        );
                                    })
                                );
                            } else {
                                await prepareAsset(params.asset, params);
                            }
                            break;

                        case '/create':
                            try {
                                // This line will succeed or have a error thrown that will be caught below
                                await validateRenderParams(params);

                                // VERY IMPORTANT LINE! Determines the uniqueness of all links
                                params.renderId = randomUUID();
                                params.theme =
                                    params.theme ??
                                    (await userSetting(
                                        params.userId,
                                        'theme'
                                    )) ??
                                    '_default';
                                ['light', 'dark'].forEach(style => {
                                    if (params.theme.includes(`-${style}`)) {
                                        params.theme = params.theme.replace(
                                            `-${style}`,
                                            ''
                                        );
                                        params.themeHue = style;
                                    }
                                });

                                const { s3Key } = await getS3Key(
                                    params.asset ||
                                        (params.assets && params.assets[0]) ||
                                        (params.collection && 'collection'),
                                    params
                                );

                                params.s3Key = s3Key;

                                params = await setRenderDefaults(params);

                                // Cache the main Genie API calls
                                response.body.preCache = await preCallGenieAPIs(
                                    params
                                );

                                // Save to the processing folder for onward processing and final render
                                const prepareKey = `_processing/${params.renderId}/render.json`;

                                // Version of this code that created the file
                                params = { ...params, version: RENDER_VERSION };
                                await toS3(
                                    prepareKey,
                                    Buffer.from(JSON.stringify(params)),
                                    { 'Genie-Delete': 'extended' },
                                    JSON_MIME
                                );

                                if (
                                    params.collection ||
                                    params.asset?.startsWith('landing-pages')
                                ) {
                                    // Create a holding page - should have a cache max-age set to 0
                                    await copyObject(
                                        '_assets/_reference/collection-rendering.html',
                                        s3Key,
                                        null,
                                        'text/html',
                                        'max-age=0'
                                    );
                                } else if (params.assets) {
                                    const availableAt = [];

                                    Promise.all(
                                        params.assets.map(async asset => {
                                            const assetS3Key = await getS3Key(
                                                asset,
                                                params
                                            );

                                            availableAt.push(assetS3Key);
                                        })
                                    );

                                    response.body.availableAt = availableAt;
                                }

                                await queueMsg('prepare', {
                                    renderId: {
                                        DataType: 'String',
                                        StringValue: params.renderId
                                    }
                                });

                                // Create a reverse lookup based on userId, mlsNumber and areaId
                                let lookUpKeys = [`renders`,`users/${params.userId}`];

                                if (params.mlsNumber) {
                                    lookUpKeys.push(
                                        `mlsNumber/${params.mlsId}/${params.mlsNumber}`
                                    );
                                }

                                if (params.areaIds) {
                                    lookUpKeys = lookUpKeys.concat(
                                        params.areaIds.map(
                                            areaId => `areas/${areaId}`
                                        )
                                    );
                                }

                                Promise.all(
                                    lookUpKeys.map(
                                        async key =>
                                            await toS3(
                                                `_lookup/${key}/${params.renderId}`,
                                                Buffer.from('@'),
                                                null,
                                                TXT_MIME
                                            )
                                    )
                                );

                                if (s3Key) {
                                    response.body.success = true;
                                    // Remove trailing index.html if it exists: S3 routing will default to that file on a folder request
                                    response.body.availableAt =
                                        response.body.availableAt ?? // Allows earlier code to set custom version of this
                                        `${
                                           params.isWorkFlow ?  genieGlobals.GENIE_NO_CACHE_HOST :  genieGlobals.GENIE_HOST
                                        }${s3Key.replace('/index.html', '')}`;
                                    response.body.reRender = `${genieGlobals.GENIE_API}re-render?renderId=${params.renderId}`;
                                    response.body.renderId = params.renderId;
                                }
                            } catch (e) {
                                response.body.error = e.message;
                            }
                            break;
                    }
                }
            } catch (error) {
                console.log('GenieAPI failed: ', error);

                if (params.renderId) {
                    // We don't want the embed API errors here
                    await toS3(
                        `_errors/${params.renderId}-${Date.now()}-api.json`,
                        Buffer.from(
                            JSON.stringify({
                                params,
                                error: error.toString()
                            })
                        ),
                        { GenieExpireFile: 'error' },
                        JSON_MIME
                    );
                }

                response.body.error = error;
            } finally {
                if (!response.isBase64Encoded) {
                    response.body = JSON.stringify(response.body);
                }
            }
        }
    }

    return response;
};

const renderKeyParams = async params => {
    let listing,
        areaId = params.area?.areaId ?? params.areaId,
        propertyType = 0,
        listingStatus = '';

    if (params.mlsNumber) {
        if (!params.propertyType || !params.listingStatus) {
            listing = await getListing(
                params.userId,
                params.mlsNumber,
                params.mlsId
            );

            if (!params.areaId && listing.preferedAreaId) {
                params.areaId = listing.preferedAreaId;
            }
        }

        if (!params.areaId) {
            const area = await areaFromMlsNumber(
                params.mlsNumber,
                params.mlsId,
                params.userId
            );
            if (area) {
                areaId = area.areaId;
            }
        }

        propertyType = params.propertyType ?? listing.propertyType;
        listingStatus = params.listingStatus ?? (listing.listingStatus ??'');
    }

    const area = await areaName(params.userId, areaId);

    return {
        reportDate: Math.round(new Date().getTime() / 1000),
        areaName: area?.areaName ?? 'unknown',
        propertyType,
        propertyCaption: params.propertyCaption ?? '',
        mlsNumber: params.mlsNumber ?? '',
        listingStatus
    };
};

const processAsset = async params => {
    const prepareKey = `_processing/${params.renderId}/render.json`;

    let s3Params = await jsonFromS3(prepareKey);
    //console.log('processAsset', s3Params, params);
    if (s3Params) {
        const renderRoot = await getRenderJSON({ ...s3Params, ...params });

        return {
            transformXml: toXML(
                { renderRoot },
                {
                    attributeFilter: (key, val) => val === null,
                    attributeExplicitTrue: true,
                    contentMap: content => {
                        return content === null ? '' : content;
                    }
                }
            ),
            transformXsl: (await fromS3(`_assets/_xsl/${params.asset}.xsl`))
                .toString()
                .replaceAll(/[\t|\n]/g, ' ')
        };
    } else {
        console.log(`processAsset failed for ${prepareKey}`);
    }
};

const prepareAsset = async (asset, params) => {
    const settings = await assetSetting(asset, 'all');

    if (Object.keys(settings).length > 0) {
        let pages, suffix, dims, size;

        const { s3Key } = await getS3Key(asset, params);

        if (params.pages) {
            pages = params.pages;
        } else if (settings.pages && settings.pages !== '') {
            pages = settings.pages.map(s => ({ asset: s }));
        } else {
            pages = [{ asset: asset.trim() }];
        }

        if (params.totalPages) {
            pages = pages.slice(0, params.totalPages + 1);
        }

        size = (
            params.size ||
            (Array.isArray(settings?.sizes) && settings.sizes[0]) ||
            genieGlobals.DEFAULT_SIZE
        )
            .replaceAll(' ', '-')
            .trim()
            .toLowerCase();

        dims = getDimensions(size) ?? { width: 1200, height: 628 };

        switch (true) {
            case params.isCollectionTemplate:
            case params.isLandingPage:
                suffix = 'html';
                break;

            case params.webp:
                suffix = 'webp';
                break;

            case size == 'video':
                suffix = 'mp4';
                dims = { width: 1920, height: 1080 };
                break;

            case params.asPDF:
            case pages.length > 1:
                suffix = 'pdf';
                break;

            default:
                suffix = 'png';
        }

        // Add a _lookup file to aid rerendering on updates
        await toS3(
            `_lookup/asset/${asset}/${params.renderId}`,
            Buffer.from('@'),
            null,
            TXT_MIME
        );

        await Promise.all(
            pages.map(async (p, i) => {
                const pageParams = {
                    ...params,
                    ...p,
                    pageIndex: pages.length > 0 ? i + 1 : null,
                    totalPages: pages.length > 0 ? pages.length + 1 : null,
                    isSample: Boolean(params.isSample),
                    size
                };

                pageParams.themeShade = pageParams.theme?.includes('dark')
                    ? 'Dark'
                    : 'Light';

                // Watermarking samples
                if (settings.permission) {
                    const user = await getUser(params.userId);
                    pageParams.isSample = !user.permissions.includes(
                        settings.permission
                    );
                }

                const isA5 = ['landing-pages', 'funnels', 'embeds'].find(
                    start => asset.startsWith(start)
                ); // The rendered output of funnels and embeds is an A5 PDF

                const withBleed = params?.withBleed ?? false;
                const width =
                    suffix === 'pdf'
                        ? isA5
                            ? '216mm'
                            : `${
                                  Math.round(dims.width) / 100 +
                                  (withBleed ? 0.25 : 0)
                              }in`
                        : Math.round(dims.width);
                const height =
                    suffix === 'pdf'
                        ? isA5
                            ? '279mm'
                            : `${
                                  Math.round(dims.height) / 100 +
                                  (withBleed ? 0.25 : 0)
                              }in`
                        : Math.round(dims.height);

                const render = {
                    ...params,
                    s3Key: params.overrideKey ?? s3Key,
                    bucket: BUCKET,
                    renderId: params.renderId,
                    isDebug: params.isDebug,
                    suffix,

                    size,

                    landscape: isA5 || dims.height < dims.width ? true : false,
                    width,
                    height,

                    withBleed,

                    dims, // required for the screen grab size

                    scale: 1, // ToDo: some decision making
                    cssPageSize: false, // ToDo: some decision making

                    /*
						ToDo?
						render.clip
						render.clipX
						render.clipY
						render.clipWidth
						render.clipHeight
					*/

                    noPuppeteer: s3Key.endsWith('html'),
                    isCollection: params.collection, // Flag for use by XSLT processor

                    pageIndex: pageParams.pageIndex,
                    totalPages: params.totalPages ?? pages.length,

                    asset: pageParams.asset,

                    tags: {
                        asset: pageParams.asset,
                        lpo: params.lpo
                    }
                };

                let qrUrl;
                if (params?.qrDestination) {
                    render.qrUrl = params.qrDestination;
                    render.tags.qrDestination = params.qrDestination;

                    if (!params.qrDestination.startsWith('http'))
                        params.qrDestination = `https://${qrUrl}`;

                    qrUrl = await getLandingQrCodeUrl(
                        params?.parentAsset,
                        params.renderId,
                        params.qrDestination
                    );
                } else if (params?.qrUrl) {
                    render.tags.qrUrl = params.qrUrl;
                    qrUrl = await getLandingQrCodeUrl(
                        params.qrUrl,
                        params.renderId
                    );
                }

                if (qrUrl) {
                    render.customizations = { qrUrl };
                }

                if (suffix === 'mp4') {
                    render.music = params.music ?? null;
                    render.slideLength = params?.page?.slideLength ?? 5;
                }

                // Create the download file is there isn't one (the url is required for the render data)
                if (settings.defaultDownload && i == 0) {
                    if (params.downloadUrl) {
                        render.downloadUrl = params.downloadUrl;
                    } else {
                        let overrideKey = s3Key.replace(
                            'index.html',
                            `${basename(pageParams.asset)}-download.pdf`
                        );
                        render.downloadUrl = `/${overrideKey}`;

                        const downloadSize = await assetSetting(
                            settings.defaultDownload,
                            'size'
                        );

                        await prepareAsset(settings.defaultDownload, {
                            ...params,
                            overrideKey,
                            size: downloadSize,
                            qrDestination: `${
                                genieGlobals.GENIE_HOST
                            }${render.s3Key.replace('/index.html', '')}`,
                            parentAsset: pageParams.asset
                        });
                    }
                }

                // Save to the processing folder to trigger onward processing and final render
                const cleanKey = basename( render.s3Key )
                    .replaceAll( /[.\/]|_/g, '-' )
                    .replaceAll( /[^\w\s-]|_/g, '' ) // Remove all non-word,number,space chars.
                    .replaceAll( '--', '-' );

                await toS3(
                    `_processing/${params.renderId}/${cleanKey}${
                        pageParams.asset.startsWith('landing-pages')
                            ? `-${basename(pageParams.asset)}`
                            : ''
                    }-p${i}-prep.json`,
                    Buffer.from(JSON.stringify(render)),
                    { 'Genie-Delete': true },
                    JSON_MIME
                );
            })
        );
    }
};

const getPropertyCaption = (id, custom = null) => {
    if (custom) return custom;

    switch (id) {
        case 3:
            return 'Condos';

        default:
            return 'Homes';
    }
};

const reRender = async (renderId, params = null) => {
    // Save to the processing folder for onward processing and final render
    const collectionExists = await headObject(
        `_processing/${renderId}/render.json`
    );

    if (collectionExists) {
        let msgAttrbs = {
            renderId: {
                DataType: 'String',
                StringValue: renderId
            }
        };

        if (params.assetId) {
            msgAttrbs.assetId = {
                DataType: 'String',
                StringValue: params.assetId
            };
        }

        if (params) {
            delete params.renderId;
            delete params.assetId;

            const override = JSON.stringify(params);

            if (override !== '{}') {
                msgAttrbs.override = {
                    DataType: 'String',
                    StringValue: override
                };
            }
        }

        await queueMsg('prepare', msgAttrbs);

        return true;
    } else {
        throw new Error(`${renderId}: render data does not exist.`);
    }
};

export const validateRenderParams = async args => {
    const errors = [];
    const msgs = [];

    try {
        // userID is required
        if (!args.userId) {
            errors.push('[userId] is required');
        } else {
            let user = await getUser(args.userId);

            if (!user.emailAddress) {
                errors.push(`Genie User not found for "${args.userId}"`);
            }
        }

        // areaID or mlsNumber:
        // ToDo: args.mlsId must exist if args.mlsNumber exists
        if (!args.areaId && !args.mlsNumber) {
            errors.push('[areaId] or [mlsNumber] are required');
        }

        // Test area Size
        if (args.areaId && !args.ignoreBoundaryError) {
            let boundary = await getAreaBoundary(args.areaId);

            if ((boundary?.mapArea?.geoJSON ?? '').length > 200000) {
                const errMsg = 'Area boundary size risks render fail';
                if (!args.ignoreBoundaryFail) {
                    errors.push(errMsg);
                } else {
                    msgs.push(errMsg);
                }
            }
        }

        // ToDO support folder/stylesheet params
        if (!args.asset && !args.collection && !args.pages && !args.assets) {
            errors.push(
                'One of [asset] or [collection] or [pages] or [assets] is required'
            );
        }

        if (args.asset) {
            let a;
            try {
                a = await getAsset(args.asset, true);
            } catch (e) {
                console.log('Validate getAsset failure:', e);
            }

            if (!a) {
                errors.push(`Asset '${args.asset}' does not exist`);
            } else {
                console.log(args, a);
            }
        }

        if (args.collection) {
            let c;
            try {
                c = await getCollection(args.collection, true);
            } catch (e) {
                console.log('Validate getCollection failure:', e);
            }

            if (!c) {
                errors.push(`Collection '${args.collection}' does not exist`);
            }
        }
    } catch (err) {
        console.log('Render validation error:', err);
    }

    if (errors.length > 0) {
        throw new Error(errors.join('; '));
    }

    return msgs;
};

const getLandingQrCodeUrl = async (asset, renderId, qrUrl = null) => {
    let s3Key = `genie-files/${renderId}/${asset}-qr.svg`;
    let landingS3Key = await getS3Key(`landing-pages/${asset}`, { renderId });

    // S3 url of the rendered landing page
    const qrSVG = await generateQR(
        qrUrl ?? `${genieGlobals.GENIE_HOST}${landingS3Key.s3Key}`
    );
    await toS3(s3Key, Buffer.from(qrSVG), null, 'image/svg+xml');

    return `${genieGlobals.GENIE_HOST}${s3Key}`;
};

export const getS3Key = async (asset, params) => {
    let s3Key = `failed/${params.renderId}.png`;

    try {
        // params.s3Key is the final destination for the render. All are public urls.
        if (asset.startsWith('collection')) {
            s3Key = `genie-collection/${params.renderId}/index.html`;
        } else if (asset.startsWith('landing-pages')) {
            const base =
                typeof params.lpo !== 'undefined'
                    ? `${basename(params.lpo)}/${basename(asset)}`
                    : basename(asset);

            s3Key = `genie-pages/${params.renderId}/${base}/index.html`;
        } else {
            const fileExtension = params?.asPDF
                ? 'pdf'
                : params?.webp
                ? 'webp'
                : null;
            const keyParams = await renderKeyParams(params);

            let { renderKey, pages } = await assetSetting(asset, [
                'renderKey',
                'pages'
            ]);

            const hasPages =
                params.pages || (Array.isArray(pages) && pages.length > 0);

            const replaces = {
                REPORTDATE: DateTime.fromSeconds(keyParams.reportDate).toFormat(
                    'LLL-yyyy'
                ),
                PROPTYPE: getPropertyCaption(
                    keyParams.propertyType,
                    keyParams.propertyCaption
                ),
                AREASLUG: keyParams.areaName.replace(
                    /(-{2,}|\/|\s)+/g,
                    (match, p1) => (p1 ? '-' : '')
                ),
                MLSNUMBER: keyParams.mlsNumber || 'mls',
                LISTSTATUS: keyParams.listingStatus || 'market'
            };

            renderKey = basename(renderKey);

            Object.keys(replaces).map(
                key => (renderKey = renderKey.replace(key, replaces[key]))
            );

            s3Key = `genie-files/${params.renderId}/${
                params.theme
            }/${renderKey}.${fileExtension || (hasPages && 'pdf') || 'png'}`;
        }
    } catch (error) {
        await toS3(
            `_errors/${params.renderId}-${Date.now()}-api.json`,
            Buffer.from(
                JSON.stringify({
                    params,
                    error: error.toString()
                })
            ),
            { GenieExpireFile: 'error' },
            JSON_MIME
        );
    }

    return {
        s3Key,
        renderKey: typeof renderKey != 'undefined' ? renderKey : null,
        hasPages: typeof hasPages != 'undefined' ? hasPages : null
    };
};
