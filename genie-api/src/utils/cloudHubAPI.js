import QRCode from 'qrcode-svg';

import { getUser } from './../genieAI.js';
import { fromS3, getFileData, listS3Folder, toS3, genieGlobals } from './index.js';

export const cloudHubAPI = async (route, params) => {
    let result = { none: true, route, params: { ...params } };

    switch (route) {
        case 'get-agent':
            const agent = await getUser(params.agentId);

            result = { success: true, agent };
            break;

        case 'recent-renders':
            const renders = await listS3Folder('_lookup/renders');
            const reRenders = await listS3Folder('_lookup/re-render');

            const restructure = arr =>
                arr.reduce((acc, { Key, LastModified }) => {
                    const renderId = Key.split('/').pop();
                    acc[renderId] = LastModified;
                    return acc;
                }, {});

            result = {
                success: true,
                renders: restructure(renders),
                reRenders: restructure(reRenders)
            };
            break;

        case 'get-assets':
            const assets = await getAssets();
            result = { success: true, ...assets };
            break;

        case 'get-themes':
            const themes = await getThemes();
            result = { success: true, ...themes };
            break;

        case 'get-collection-templates':
            const templates = await getCollectionTemplates();
            result = { success: true, ...templates };
            break;

        case 'get-collections':
            const collections = await getCollections();
            const processedCollections = {};

            for (const index in collections) {
                if (collections[index].Key.endsWith('json')) {
                    processedCollections[basename(collections[index].Key)] =
                        JSON.parse(
                            (await fromS3(collections[index].Key)).toString()
                        );
                }
            }

            result = {
                success: true,
                collections: processedCollections
            };
            break;

        case 'save-collection':
            const collectionSaved = await saveCollection(params);
            response.body = {
                success: true,
                collection: collectionSaved
            };
            break;

        case 'render-errors':
            const errors = [];
            const rErrors = await listS3Folder('_errors');

            await Promise.all(
                rErrors.map(async e => {
                    if (!params.renderId || e.Key.includes(params.renderId)) {
                        if (e.Size > 0) {
                            const json = JSON.parse(
                                (await fromS3(e.Key)).toString()
                            );

                            json.key = e.Key;

                            errors.push(json);
                        }
                    }
                })
            );

            response.body = { success: true, ...errors };
            break;
    }

    return result;
};

/**
 * getThemes
 *
 * @return object
 */
const getThemes = async () => {
    let themes = {};
    const r = await listS3Folder('_assets/themes');

    await Promise.all(
        r.map(async t => {
            if (t.Size > 0) {
                const css = await fromS3(t.Key);

                const data = getFileData(css, { name: 'Theme Name' });

                const slug = t.Key.replace('.css', '').replace(
                    '_assets/themes/',
                    ''
                );

                themes[slug] = data;
            }
        })
    );

    return { themes };
};

/**
 * getAssets
 *
 * @return object
 */
const getAssets = async () => {
    let assets = {};
    const r = await listS3Folder('_assets/_xsl');

    await Promise.all(
        r.map(async t => {
            if (t.Size > 0) {
                const xsl = await fromS3(t.Key);

                const data = getFileData(xsl, genieGlobals.ASSET_HEADERS);

                const slug = t.Key.replace('.xsl', '').replace(
                    '_assets/_xsl/',
                    ''
                );

                assets[slug] = data;
            }
        })
    );

    return { assets };
};

/**
 * get_collection_templates
 *
 * @return array
 */
const getCollectionTemplates = async () => {
    const templates = await listS3Folder('assets/_xsl/collections');

    // Include?
    templates.filter(t => true); // ToDo Filter on 'include-in-render'

    return { templates };
};

/**
 * get_collections
 *
 * @return array
 */
const getCollections = async () =>
    await listS3Folder('genie-tools/collections');

/**
 * save_collections
 *
 * @return array
 */
const saveCollection = async data => {
    await toS3(
        `genie-tools/collections/${data.template}.json`,
        Buffer.from(JSON.stringify(data.collection))
    );

    return true;
};

/**
 * generate_qr
 */
export const generateQR = async url => new QRCode(url).svg();
