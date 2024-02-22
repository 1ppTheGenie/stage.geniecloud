import QRCode from 'qrcode-svg';
import { fromS3, getFileData, listS3Folder, toS3 } from './index.js';

export const ASSET_HEADERS = {
    name: 'Asset Name',
    knownAs: 'Known As',
    thumbnail: 'Thumbnail',
    access: 'Access',
    permission: 'Permission',
    approved: 'Approved',
    tags: 'Tags',
    sizes: 'Sizes',
    roles: 'Roles',
    component: 'Component',
    supports: 'Supports',
    version: 'Version',
    pages: 'Pages',
    renderKey: 'Render Key'
};

/**
 * getThemes
 *
 * @return object
 */
export const getThemes = async () => {
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
export const getAssets = async () => {
    let assets = {};
    const r = await listS3Folder('_assets/_xsl');

    await Promise.all(
        r.map(async t => {
            if (t.Size > 0) {
                const xsl = await fromS3(t.Key);

                const data = getFileData(xsl, ASSET_HEADERS);

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
export const getCollectionTemplates = async () => {
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
export const getCollections = async () =>
    await listS3Folder('genie-tools/collections');

/**
 * save_collections
 *
 * @return array
 */
export const saveCollection = async data => {
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
