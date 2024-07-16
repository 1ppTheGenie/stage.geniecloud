// prettier-ignore
import { stat } from "fs";
import {
	getUser,
	areaStatisticsMonthly,
    areaName,
	getShortData,
	areaStatisticsWithPrevious,
	mlsProperties,
	getAreaBoundary,
	getAssessorPropertiesDetail,
	getQRProperty,
	getPropertyFromId,
	createLead,
	updateLead,
} from "../genieAI.js";

export const embedsAPI = async (route, params) => {
    let result = {};

    try {
        switch (route) {
            case 'get-landing-data':
                result = await getLandingPageData(params);
                break;
            case 'add-lead':
                result = await add_lead(params);
                break;
            case 'update-lead':
                result = await update_lead(params);
                break;
            case 'address-search':
                result = await address_search(params);
                break;
            case 'get-agent-data':
                result = await get_agent_data(params);
                break;
            case 'get-area-data':
                result = await get_area_data(params);
                break;
            case 'get-area-monthly':
                result = await get_area_monthly(params);
                break;
            case 'get-area-properties':
                result = await get_area_properties(params);
                break;
            case 'get-area-polygon':
                result = await get_area_polygon(params);
                break;
            case 'get-listing-data':
                result = await get_listing_details(params);
                break;
            case 'get-qr-property':
                result = await get_qr_property(params);
                break;
            case 'get-short-data':
                result = await get_short_data(params);
                break;
            case 'get-property':
                result = await get_property(params);
                break;
            case 'get-mls-display':
                result = await get_mls_display(params);
                break;
            default:
                throw new Error(`Unknown route: ${route}`)
        }
    
        if (result) {
            result.route = `Embed: ${route}`;
        } else {
            result = { route: `Embed: ${route}`, error: 'No result returned' };
        }
    } catch (error) {
        console.error(`Error in embedsAPI for route ${route}:`, error);
        result = { route: `Embed: ${route}`, error: error.message };
    }

    return result;
};

export const getLandingPageData = async params => {
    let { propertyId, qrId, shortUrlDataId, token, agentId, hideAVM } = {
        ...params
    };
    let property = null,
        lead = null;

    if (token) {
        if (typeof qrId !== 'undefined') {
            property = await getQRProperty(qrId, token);

            lead = {
                genieLeadId: property.genieLeadId,
                salutation: property.ownerDisplayName
            };
        } else if (typeof shortUrlDataId !== 'undefined') {
            lead = await getShortData(parseInt(shortUrlDataId), token, agentId, params.skipLeadCreate);

            if (!propertyId) {
                propertyId = lead.propertyId;
            }
        }
    }

    if (propertyId && !property) {
        property = await getPropertyFromId(propertyId, agentId);
    }

    if (property) {
        let data = {
            lead,
            id: property.propertyID,
            firstName: property.firstName,
            lastName: property.lastName,
            emailAddress: property.emailAddress,
            ownerDisplayName: property.ownerDisplayName,
            latitude: property.latitude,
            longitude: property.longitude,
            boundaryJSON: property.boundary.geoJSON,
            address: property.siteAddress,
            city: property.siteAddressCity,
            state: property.siteAddressState,
            zip: property.siteAddressZip,
            bedrooms: property.bedrooms,
            bathrooms: property.bathrooms,
            sqFt: property.sumBuildingSqFt.toLocaleString('en-US'),
            yearBuilt: property.yearBuilt,
            currentAVM: property.firstAmericanCurrentAVM,
            avmLow: property.avmLow,
            avmHigh: property.avmHigh
        };

        if (!hideAVM || hideAVM == false || hideAVM == 0) {
            if (data.currentAVM && data.currentAVM !== '') {
                data.avm = data.currentAVM;
                delete data.currentAVM;
            } else if (!data.avmLow || data.avmLow !== '') {
                data.avm = data.avmLow;
            } else if (!data.avmHigh || data.avmHigh !== '') {
                data.avm = data.avmHigh;
            } else {
                data.avm = `${data.avmLow} - ${data.avmHigh}`;
            }
        }

        return data;
    }
};

const get_property = async params => {
    var agent_id = params.agentID || params.agent || params.agent_id || null;

    if (agent_id) {
        var property = genie_get_property_from_id(params.property_id, agent_id);

        if (property) {
            return success({ property });
        }
    }

    return error(['No property found']);
};

const get_short_data = async params => {
    const r = getShortData(
        parseInt(params.shortId),
        params.token,
        params.agentId || null
    );

    return r ? success({ property: r }) : error('No short data found');
};

const get_qr_property = async params => {
    var property = genie_get_qr_property(params.qrID, params.token);

    return property ? success({ property }) : error('No QR property found');
};

const add_lead = async params => {
    const agentId = params.agentId || params.agent || null;

    if (agentId) {
        var args = {};
        var keys = [
            'genieTags',
            'firstName',
            'lastName',
            'phoneNumber',
            'email',
            'emailAddress',
            'phoneNumber',
            'phone',
            'referringUrl',
            'note',
            'areaId',
            'propertyId',
            'leadInquiryType',
            'trackingData'
        ];

        let argsKey;
        for (var i = 0; i < keys.length; i++) {
            var key = keys[i];

            if (params.hasOwnProperty(key)) {
                var value = null;

                switch (key) {
                    case 'genieTags':
                        argsKey = 'tags';
                        value = params[key].split(',');
                        break;

                    case 'email':
                        argsKey = 'emailAddress';
                        break;

                    case 'phone':
                        argsKey = 'phoneNumber';
                        break;

                    default:
                        argsKey = key;
                        break;
                }

                args[argsKey] = value !== null ? value : params[key];
            }
        }

        if (params.hasOwnProperty('fullName') && params.fullName ) {
            var split = params?.fullName?.split(' ');

            if (split && split.length > 1) {
                var last = split.pop();

                args['lastName'] = last;
                args['firstName'] = split.join(' ');
            } else {
                args['firstName'] = params.fullName;
            }
        }

        if (params.hasOwnProperty('meta[message]') && params.hasOwnProperty('meta[message]') != null) {
            args['note'] = 'Message: ' + params?.meta["message"];
            delete params.meta["message"];
        } else {
            args['note'] = args['note'] || '';
        }

        var meta_keys = Object.keys(params).reduce(function (m, str) {
            if (str && str.match(/meta\[(.*)\]/)) {
                m.push(str.match(/meta\[(.*)\]/)[1]);
            }
            return m;
        }, []);

        if ( meta_keys ) {
            for ( var j = 0; j < meta_keys.length; j++ ) {
                var key = meta_keys[j];

                if ( !args.note ) args.note = '';

                args['note'] += `\n${key}: ${params[`meta[${key}]`]}`;
            }
        }

        if (Object.keys(args).length > 0) {
            const lead = await createLead(agentId, args);

            return success(lead);
        } else {
            return error('No lead arguments');
        }
    } else {
        return error('Missing agent ID');
    }
};

const update_lead = async params => {
    var agentId = params.agentId || params.agentID || params.agent || null;

    if (agentId) {
        let args = {};
        let keys = [
            'genieLeadId',
            'email',
            'phone',
            'note',
            'emailAddress',
            'phoneNumber',
            'genieTags'
        ];

        for (let i = 0; i < keys.length; i++) {
            const key = keys[i];

            if (params.hasOwnProperty(key)) {
                let value = null,
                    argsKey = null;

                switch (key) {
                    case 'genieTags':
                        argsKey = 'tags';
                        value = params[key].split(',');
                        break;

                    case 'emailAddress':
                        argsKey = 'emailAddress';
                        break;

                    case 'phoneNumber':
                        argsKey = 'phone';
                        break;

                    default:
                        argsKey = key;
                        break;
                }

                args[argsKey] = value !== null ? value : params[key];
            }
        }

        if (Object.keys(args).length > 0) {
            return success(await updateLead(agentId, args));
        } else {
            return error('No lead arguments');
        }
    } else {
        return error('Missing agent ID');
    }
};

const address_search = async params => {
    const r = await getAssessorPropertiesDetail('1|' + params.place_id);

    return success({ properties: r['properties'] });
};

const get_agent_data = async params => {
    const profile = await getUser(params.agentId ?? params.agent_id);

    delete profile.aspNetUserId;
    delete profile.organizationId;
    delete profile.roleId;
    delete profile.intercom;
    delete profile.facebookProfile;
    delete profile.twilioBotProfile;
    delete profile.socialProfiles;
    delete profile.codeSnippets;
    delete profile.slackChannel;
    delete profile.google;
    delete profile.hasProfile;
    delete profile.hasImages;
    delete profile.hasOffice;
    delete profile.hasDisclaimers;
    delete profile.hasSocialProfiles;
    delete profile.hasCodeSnippets;
    delete profile.hasSlackChannel;
    delete profile.hasGoogleSettings;
    delete profile.thresholds;
    delete profile.whmcsId;

    if (!params.isDebug) {
        delete profile.isActive;
        delete profile.permissions;
        delete profile.mlsProfiles;
    }

    return success({ agent: profile });
};

const get_listing_details = async params => {
    var result = await genie_mls_get_by_number(params.mlsid, params.slug);
    {
    }

    if (!result.photoPrimary || result.photoPrimary === '') {
        result.boundary = genie_property_boundary(
            params.id,
            params.slug,
            null,
            null
        );
    }

    return success({ listing: result });
};

const get_mls_display = async params => {
    return success(genie_mls_display_settings(parseInt(params.id)));
};

const get_area_properties = async params => {
    const profile = await getUser(params.agentId);
    const mlsGroupId = profile.mlsGroupId ?? 0;

    const r = await mlsProperties(
        mlsGroupId,
        params.areaId,
        new Date(
            Date.now() -
                parseInt(params.areaPeriod ?? 12) * 30 * 24 * 60 * 60 * 1000
        ).toISOString(),
        false
    );

    const properties = r.map(p => {
        const {
            listingAgentName,
            listingBrokerName,
            lotSqft,
            saleAgent,
            apn,
            acres,
            yearBuilt,
            saleType,
            propertyType,
            bathroomsFull,
            bathroomsHalf,
            mlsID,
            state,
            city,
            ...remainder
        } = p;

        return remainder;
    });

    return Array.isArray(properties)
        ? success(properties)
        : error({ noProps: true });
};

const get_area_monthly = async params => {
    let statistics = await areaStatisticsMonthly(
        params.agentId,
        parseInt(params.areaId),
        Math.ceil((params.areaPeriod ?? 12) / 12)
    );

    const areaNameResult = await areaName(params.agentId, parseInt(params.areaId));

    if (statistics.success && areaNameResult.areaName !== statistics.areaName) {
        statistics = { ...statistics, areaName: areaNameResult.areaName };
    }

    return statistics.success ? success(statistics) : error(statistics);
};

const get_area_data = async params => {
    let statistics = await areaStatisticsWithPrevious(
        params.agentId,
        parseInt(params.areaId),
        parseInt(params.areaPeriod || 12)
    );

    const areaNameResult = await areaName(params.agentId, parseInt(params.areaId));

    if (areaNameResult.areaName !== statistics.areaName) {
        statistics = { ...statistics, areaName: areaNameResult.areaName };
    }

    return statistics.success ? success(statistics) : error(statistics);
};

const get_area_polygon = async params => {
    const r = await getAreaBoundary(params.areaId);

    if (r?.success === true) {
        return success({
            polygon: r.mapArea
        });
    }

    return error('getAreaBoundary failed');
};

const error = msg => ({ success: false, error: msg });

const success = async params => ({ success: true, result: params });
