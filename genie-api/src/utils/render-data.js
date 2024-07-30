import { DateTime } from 'luxon';

/* prettier-ignore */
import { generateQR, endOfLastMonth, genieGlobals, MINUTE_IN_SECONDS, NOW, dateAdd, timeAgo, toS3, jsonFromS3, listS3Folder, assetSetting } from "./index.js";
/* prettier-ignore */
import {  areaName,openhouseByMlsNumber, getListing, agentProperties, mlsProperties, areaStatisticsMonthly, areaStatisticsWithPrevious, propertySurroundingAreas, getUser, getAreaBoundary, mlsDisplaySettings, } from "./../genieAI.js";
import { getS3Key } from './../index.js';

export const getRenderJSON = async params => {
    if (typeof params != 'object' || Object.keys(params).length == 0) {
        throw new Exception('Empty render param set is not supported');
    }

    const skipCache = params.skipCache ?? false;

    // Additional params
    if (!params.offsetDate) {
        params.offsetDate = endOfLastMonth();
    }

    const warnings = [];
    const datePeriod2 = params.datePeriod * 2;

    // propertyType should never be -1 here, so set a default
    if (params.propertyType === null || parseInt(params.propertyType) < 0) {
        const propertyTypeId = params.mlsNumber
            ? await listingPropertyTypeId(params)
            : 0;

        console.log(
            `Forced propertyType switch from ${params.propertyType} to ${propertyTypeId}.`
        );
        warnings.push({
            warning: `Forced propertyType switch from ${params.propertyType} to ${propertyTypeId}.`
        });
        params.propertyType = propertyTypeId;
    }

    let renderSettings = filteredMerge(defaultRenderSettings, params);

    // Specials
    if (params.downloadUrl) {
        renderSettings.downloadUrl = params.downloadUrl;
    }

    const periodFormat = 'LLL `yy';

    const root = {
        // *** Output
        output: {
            _attrs: await processOutput(
                params.userId,
                params.datePeriod,
                params.renderId,
                renderSettings
            )
        },

        // *** Dates
        date: {
            _attrs: {
                period:
                    dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
                        months: -params.datePeriod
                    }).toFormat(periodFormat) +
                    ' to ' +
                    DateTime.fromMillis(params.offsetDate).toFormat(
                        periodFormat
                    ),

                previousPeriod:
                    dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
                        months: -datePeriod2
                    }).toFormat(periodFormat) +
                    ' to ' +
                    dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
                        months: -params.datePeriod
                    }).toFormat(periodFormat)
            }
        },

        // *** Overrides
        xslAsset: params.asset.replaceAll('/', '_'),

        // *** Overrides
        overrides: params.customizations
            ? processCustomizations(params.customizations)
            : {},

        // *** Agents
        agents: await processAgents([
            params.userId,
            ...(params?.renderSettings?.additionalAgents ?? [])
        ]),

        // *** Areas
        areas: params.isEmbed
            ? params.areaIds.map(id => ({ id }))
            : await processAreas(params)
    };

    // Slightly weird place for this code, but...generate QR image
    let qrUrl = params.qrCode ?? root.agents[0].agent.website ?? '';

    if (qrUrl == 'skip') {
        root.output._attrs.qrUrl = 'skip';
    } else if (params.customizations?.qrUrl) {
        root.output._attrs.qrUrl = params.customizations?.qrUrl;
    } else if (qrUrl && qrUrl !== '') {
        if (!qrUrl.startsWith('http')) qrUrl = `https://${qrUrl}`;

        const qrSVG = await generateQR(decodeURI(qrUrl));

        await toS3(
            `genie-files/${params.renderId}/qr.svg`,
            Buffer.from(qrSVG),
            null,
            'image/svg+xml'
        );

        root.output._attrs.qrUrl = `${genieGlobals.GENIE_HOST}genie-files/${params.renderId}/qr.svg`;
    }

    if (params.mlsNumber) {
        // ** OPEN HOUSE TIMES
        let times = [];

        if (params.openHouseTimes) {
            params.openHouseTimes.forEach(t => {
                // Support timestamps and formatted date/time strings
                times.push(
                    typeof t == 'string' ? DateTime.fromISO(t).toMillis() : t
                );
            });
        } else {
            const r = await openhouseByMlsNumber(
                params.mlsId,
                params.mlsNumber,
                skipCache
            );
            if (r.openHouses && Array.isArray(r.openHouses)) {
                r.openHouses.forEach(t => {
                    times.push(DateTime.fromISO(t.startDateUtc).toMillis());
                    times.push(DateTime.fromISO(t.endDateUtc).toMillis());
                });
            }
        }
        params.openHouseTimes = times;

        root.single = await processListing(
            params,
            root.agents[0].agent.timezone
        );

        let mlsDisplay = await mlsDisplaySettings(params.mlsId ?? 0, skipCache);

        if (mlsDisplay) {
            /* TODO!
			let html_node = Utilities.html_2_xml(
				mlsDisplay.mlsGroupDisplaySettings.listingPageDisclaimer,
				"disclaimer"
			);
			*/
            //			console.log("mlsDisplay", mlsDisplay);
            root.mlsDisplay = `<![CDATA[${
                mlsDisplay?.mlsGroupDisplaySettings?.listingPageDisclaimer ?? ''
            }]]>`; // { html_node }; // ToDo?	$mlsDisplay->appendChild($dom->importNode($html_node, true));
        }
    }

    if (params?.collection) {
        root.collection = await processCollection(params);
    }

    //	console.log("gRoot", root);
    return root;
};

const processOutput = async (userId, datePeriod, renderId, renderSettings) => {
    const now = new Date();
    const offsetDate = endOfLastMonth();

    return {
        apiUrl: genieGlobals.GENIE_API,
        siteUrl: genieGlobals.GENIE_HOST,
        year: now.getFullYear(),
        reportDate: Math.round(now.getTime() / 1000),
        sinceDate: dateAdd(offsetDate, { months: -datePeriod }).toSeconds(),
        renderId,
        mapboxKey: genieGlobals.MAPBOX_KEY,
        googleKey: genieGlobals.GOOGLE_KEY,
        areaIndex: 1,
        areaPeriod: datePeriod,
        userId,
        version: await buildVersion(),
        // ToDo isGenieTeam: user_params.roles.includes("genie_client_team" ),
        ...renderSettings
    };
};

const filteredMerge = (...objects) => {
    const firstObjectKeys = Object.keys(objects[0]);

    return objects.reduce((merged, obj) => {
        return Object.entries(obj)
            .filter(([key]) => firstObjectKeys.includes(key))
            .reduce((result, [key, value]) => {
                result[key] = value;
                return result;
            }, merged);
    }, {});
};

const defaultRenderSettings = {
    size: 'facebook',
    theme: '_default',
    themeHue: '',
    additionalAgents: null,
    propertyType: 0,
    mapStyle: 'satellite-streets-v9',
    mapIcon: 'dot',
    mapKey: false,
    pricePercent: 'percent',
    listingStatus: 'all',
    listingCount: '10',
    withBleed: false,
    withCrops: false,
    blurPrice: false,
    hideAVM: true,
    requireSignin: false,
    customerName: null,
    isLeadCapture: false,
    downloadUrl: '',
    openHouseTimes: null,
    propertyCaption: null,
    propertyCaptionSingular: null,
    reRenderUntil: null
};

export const areaFromMlsNumber = async (
    mlsNumber,
    mlsId,
    userId,
    skipCache = false
) => {
    const listing = await getListing(userId, mlsNumber, mlsId);

    if (listing && listing.preferredAreaId) {
        return await areaName(userId, listing.preferredAreaId, skipCache);
    }

    const areas = await propertySurroundingAreas(
        mlsNumber,
        mlsId,
        userId,
        null,
        null,
        skipCache
    );
    console.log(`Surrounding areas found:`, areas);

    if (Array.isArray(areas) && areas.length > 0) {
        let set = areas.filter(
            area => !['City', 'CarrierRoute', 'School'].includes(area.areaType)
        );

        if (set.length === 0) {
            return areas.pop();
        }

        let subset = set.filter(
            area => area.areaApnCount >= 1000 && area.areaApnCount <= 3000
        );

        if (subset.length === 0) {
            subset = set.filter(area => area.areaType == 'ZipCode');
        }

        if (subset.length > 0) {
            return subset.shift();
        } else {
            return set.shift();
        }
    }
    console.log(`No suitable area found for MLS number: ${mlsNumber}`);
    
    return null;
};

const agentMlsNumbers = async userId => {
    const r = await agentProperties(userId, false);

    return r.properties.map(p => p.mlsNumber.toLowerCase());
};

const singleAddress = listing => {
    let address = `${listing.streetNumber} ${listing.streetName}`;

    if (listing.unitNumber && listing.unitNumber !== '') {
        address += ` - #${listing.unitNumber}`;
    }
    return address;

    // For now, at least, we don't want the full address
    // return sprintf( '%s, %s %s %s', $address, $listing->city, \strtoupper( $listing->state ), $listing->zip );
};

export const setRenderDefaults = async params => {
    // ** DATES
    params.offsetDate = endOfLastMonth();
    params.datePeriod = params.datePeriod || params.areaPeriod || 12;

    // ** MLS ID
    if (params.mlsNumber && !params.mlsId) {
        params.mlsId = 0;
    }

    if (params.mlsNumber) {
        if (!params.propertyType || !params.areaId) {
            const listing = await getListing(
                params.userId,
                params.mlsNumber,
                params.mlsId
            );

            if (!params.areaId && listing.preferedAreaId) {
                params.areaId = listing.preferedAreaId;
            }

            if (!params.propertyType) {
                params.propertyType = parseInt(listing.propertyTypeID ?? 0);
            }
        }
    }

    // ** AREA(s)
    if (params.areaId && !params.areaIds) {
        params.areaIds = [params.areaId];
    }

    if (params.mlsNumber && !params.areaId) {
        params.area = await areaFromMlsNumber(
            params.mlsNumber,
            params.mlsId,
            params.userId
        );
    
        if (params.area) {
            params.areaIds = [params.area.areaId];
        } else {
            throw new Error(  // Changed from Exception to Error
                `Failed to get areaId: ${JSON.stringify(params)}`
            );
        }
    }

    params.theme = params.theme ?? '_default';

    return params;
};

export const userSetting = async (userId, setting) => {
    const user = await getUser(userId);

    switch (setting) {
        case 'theme':
            return user.marketingSettings.profile.defaultTheme;
    }
};

const processAgents = async agentIds => {
    let agents = [];

    await Promise.all(
        agentIds.map(async agentID => {
            const profile = await getUser(agentID);

            const marketingSettings = profile.marketingSettings;

            const findImage = id => {
                const image = marketingSettings.images.find(
                    img => img.marketingImageTypeId == id
                );

                return image ? image.url : '';
            };

            const getDisclaimer = id => {
                const disclaimer = marketingSettings.disclaimers.find(
                    d => d.marketingDisclaimerTypeId == id
                );

                return (
                    disclaimer ?? {
                        text: '',
                        url: ''
                    }
                );
            };

            const getSnippet = id => {
                const snippet = marketingSettings.codeSnippets.find(
                    d => d.marketingSnippetTypeId == id
                );

                return (
                    snippet ?? {
                        codeSnippet: ''
                    }
                );
            };

            // const prepareSnippet = (snippet) => {
            //     return snippet.codeSnippet
            //         .replace(/&/g, '&amp;')
            //         .replace(/</g, '&lt;')
            //         .replace(/>/g, '&gt;')
            //         .replace(/"/g, '&quot;')
            //         .replace(/'/g, '&apos;')
            //         .replace(/\r\n|\n|\r/g, '&#10;');
            // };

            let timezone, tzOffset;
            switch (marketingSettings.profile?.timeZoneId) {
                case 1:
                    timezone = 'America/New_York';
                    break;
                case 2:
                    timezone = 'America/Chicago';
                    break;
                case 3:
                    timezone = 'America/Denver';
                    break;
                case 4:
                    timezone = 'America/Los_Angeles';
                    break;
                case 5:
                    timezone = 'America/Anchorage';
                    break;
                case 6:
                    timezone = 'Pacific/Honolulu';
                    break;
                default:
                    timezone = 'America/Los_Angeles';
                    break;
            }
            let about = (marketingSettings.profile.about ?? '').replaceAll(
                '\r\n',
                '&#10;'
            );

            const agent = {
                firstName: profile.firstName,
                lastName: profile.lastName,
                role: profile.roleDescription,
                photo: findImage(1), //"me"

                // Switching the naming IS CORRECT! Light logo used on dark themes and vice versa
                personalLogoLight: findImage(2), //"personal_logo_dark"
                personalLogoDark: findImage(3), // "personal_logo_light"
                companyLogoLight: findImage(4), //"company_logo_dark"
                companyLogoDark: findImage(6), // "company_logo_light"

                marketingName: marketingSettings.profile.displayName ?? null,
                marketingTitle: marketingSettings.profile.title ?? null,
                marketingEmail: marketingSettings.profile.email ?? null,
                marketingAbout: `<![CDATA[${about}]]>`,
                marketingLicense:
                    marketingSettings.profile.licenseNumber ?? null,

                privacySource: getDisclaimer(1).url, // "privacy_source"
                privacyPolicy: getDisclaimer(1).text, // "privacy_text"
                disclaimerOptin: getDisclaimer(2).text, // "optin"
                disclaimerExtra: getDisclaimer(4).text, //"htmlDisclaimer"
                disclaimerIDX: getDisclaimer(3).text, // "idxDisclaimer"

                snippetHeadTag: `<![CDATA[${getSnippet(1).codeSnippet}]]>`,
                snippetOpenBodyTag: `<![CDATA[${getSnippet(2).codeSnippet}]]>`,
                snippetCloseBodyTag: `<![CDATA[${getSnippet(3).codeSnippet}]]>`,

                pronoun: marketingSettings.profile.isTeam
                    ? 'plural'
                    : 'singular',
                timezone,
                tzOffset: DateTime.local().setZone(timezone).offset,

                mobile: marketingSettings.profile.phone ?? null,
                website: marketingSettings.profile.websiteUrl ?? null,
                email: marketingSettings.profile.email,
                agentId: agentID,

                // *** AGENT ADDRESS
                address: {
                    company: marketingSettings.office.companyName ?? '',
                    street: marketingSettings.office.address ?? '',
                    address2: marketingSettings.office.address2 ?? '',
                    city: marketingSettings.office.city ?? '',
                    state: marketingSettings.office.state ?? '',
                    zip: marketingSettings.office.zip ?? ''
                }
            };

            agents.push({ agent });
        })
    );

    return agents;
};

const processCustomizations = customizations => {
    const overrides = [];

    Object.keys(customizations).forEach(key => {
        const content = customizations[key];

        if (typeof content == 'object') {
            overrides.push({ _name: key, _content: content });
        } else if (typeof content == 'string') {
            overrides.push({ _name: key, _content: content });
        }
    });

    return overrides;
};

const processAreas = async params => {
    const areas = [];

    await Promise.all(
        params.areaIds.map(async areaId => {
            const boundary = await getAreaBoundary(areaId);
            const statsData = await areaStatisticsWithPrevious(
                params.userId,
                parseInt(areaId),
                parseInt(params.datePeriod || 12)
            );

            params.isDebug &&
                debugLog('areaStatisticsWithPrevious', params, statsData);

            const areaName = statsData.areaName; // ToDo? Utilities::clean_html_entities(statsData.areaName);

            let areaImage = null;
            const area_images = []; // ToDo (array) Users::meta('area-images', userId);
            area_images.forEach(image => {
                if (!Array.isArray(image)) {
                    //					continue;
                }

                if (image.id == areaId) {
                    areaImage = image.image;
                }
            });

            const defaultJSON = '{"type": "FeatureCollection","features": []}';
            let geoJSON = boundary?.mapArea?.geoJSON ?? defaultJSON;
            if (geoJSON.length > 200000) {
                geoJSON = defaultJSON;
            }

            const area = {
                _name: 'area',
                _content: [
                    { id: areaId },
                    { name: areaName ?? params?.area?.name ?? 'NOT SET' },
                    { geojson: `<![CDATA[${geoJSON}]]>` },
                    { centerLat: boundary?.mapArea?.centerLatitude ?? 32.71 },
                    {
                        centerLng: boundary?.mapArea?.centerLongitude ?? -117.16
                    },
                    { image: areaImage ?? '' }
                ]
            };

            if (statsData.statistics) {
                let propertyTypeData, prevData;

                statsData.statistics.propertyTypeData.forEach(pData => {
                    if (pData.type == (params.propertyType ?? 0)) {
                        propertyTypeData = pData.statistics;
                        prevData = propertyTypeData.previousPeriod;
                    }
                });

                // **** LISTINGS
                const mls_properties = await mlsProperties(
                    params.mlsId ?? 0,
                    areaId,
                    NOW.plus({ months: params.datePeriod * -1 }).toISO()
                );

                params.isDebug &&
                    debugLog('mlsProperties', params, mls_properties);

                if (mls_properties && Array.isArray(mls_properties)) {
                    const agentListings = await agentMlsNumbers(params.userId);
                    const listings = [];
/*
                    mls_properties.sort((a, b) => {
                        if (
                            agentListings.includes(
                                a.mlsNumber.toLowerCase()
                            ) ===
                            agentListings.includes(b.mlsNumber.toLowerCase())
                        ) {
                            const aDate = DateTime.fromISO(
                                a.soldDate ?? a.listDate
                            );
                            const bDate = DateTime.fromISO(
                                b.soldDate ?? b.listDate
                            );

                            return aDate === bDate ? 0 : aDate < bDate ? 1 : -1;
                        } else {
                            return agentListings.includes(
                                a.mlsNumber.toLowerCase()
                            )
                                ? 1
                                : -1;
                        }
                    });*/

                    mls_properties.forEach(p => {
                        if (
                            p.propertyTypeID ==
                            (params.propertyType ?? params.propertyTypeID ?? 0)
                        ) {
                            const state =
                                parseInt(p.statusTypeID) == 4 ||
                                parseInt(p.statusTypeID) == 12 ||
                                parseInt(p.statusTypeID) == 3
                                    ? 'pending'
                                    : p.statusType.toLowerCase();

                            listings.push({
                                _name: 'listing',
                                _attrs: {
                                    lat: p.latitude,
                                    lon: p.longitude,
                                    // TODO: Lookup based on statusTypeID rather than the string
                                    /*
								Use values:
								1    Active
								2    Sold
								3    Pending
								4    Contingent - Pending
								12    Active With Contingency - Pending
								13    Expired - DON@T INCLUDE */
                                    state: state,
                                    address: singleAddress(p),
                                    beds: p.bedrooms,
                                    baths: p.bathroomsTotal,
                                    size: p.sqft,
                                    listPrice: p.priceHigh,
                                    salePrice: p.salePrice ?? null,
                                    listedDate: DateTime.fromISO(
                                        p.listDate
                                    ).toSeconds(),
                                    soldDate: p.soldDate
                                        ? DateTime.fromISO(
                                              p.soldDate
                                          ).toSeconds()
                                        : null,
                                    dom: p.daysOnMarket,
                                    thumb: p.photoPrimaryUrl,
                                    isAgent: agentListings.includes(
                                        p.mlsNumber.toLowerCase()
                                    )
                                        ? 1
                                        : 0,
                                    sortDate: p.soldDate
                                        ? DateTime.fromISO(
                                              p.soldDate
                                          ).toSeconds()
                                        : DateTime.fromISO(
                                              p.listDate
                                          ).toSeconds()
                                }
                            });
                        }
                    });
                    area._content.push({
                        _name: 'listings',
                        _content: listings
                    });

                    const statistics = [
                        {
                            _name: 'previous',
                            _attrs: {
                                totalSold: prevData?.sold,
                                turnOver: prevData?.turnOver,
                                avgPricePerSqFtSold: prevData?.avgPricePerSqFt,
                                avgPricePerSqFtList:
                                    prevData?.avgSoldListingsListPricePerSqFt,
                                averageListPriceForSold:
                                    prevData?.avgListPriceForSold,
                                averageSalePrice: prevData?.avgSalePrice,
                                averageDaysOnMarket: prevData?.avgDaysOnMarket,
                                medianSalePrice: prevData?.medSalePrice,
                                maxSalePrice: prevData?.maxSale?.salePrice,
                                minSalePrice: prevData?.minSale?.salePrice
                            }
                        }
                    ];

                    // *** BY BEDROOM
                    const byBedroom = { _name: 'byBedroom', _content: [] };
                    propertyTypeData.bedroomStats.forEach(stat => {
                        byBedroom._content.push({
                            _name: 'bedroom',
                            _attrs: {
                                number: stat.beds,
                                sold: stat.sold,
                                active: stat.active,
                                pending: stat.pending,
                                averageSalePrice: stat.avgSalePrice,
                                averageListPrice: stat.avgListPrice,
                                averageListPriceForSold:
                                    stat.avgListPriceForSold
                            }
                        });
                    });
                    statistics.push(byBedroom);

                    // *** BY SIZE
                    const bySize = { _name: 'bySize', _content: [] };
                    propertyTypeData.squareFootStats.forEach(stat => {
                        bySize._content.push({
                            _name: 'size',
                            _attrs: {
                                min: stat.min,
                                max: stat.max,
                                sold: stat.sold,
                                active: stat.active,
                                pending: stat.pending,
                                averageSalePrice: stat.avgSalePrice,
                                averageListPrice: stat.avgListPrice,
                                averageListPriceForSold:
                                    stat.avgListPriceForSold
                            }
                        });
                    });
                    statistics.push(bySize);

                    // *** BY QUARTILE
                    const monthly = await areaStatisticsMonthly(
                        params.userId,
                        areaId,
                        Math.ceil(params.datePeriod / 12)
                    );
                    if (monthly.statistics) {
                        const history = { _name: 'history', _content: [] };
                        // Only take what we need -( NB: datePeriod * 2 because both property types are in there)
                        monthly.statistics
                            .slice((params.datePeriod + 1) * 2 * -1)
                            .forEach(m => {
                                if (m.propertyTypeId == params.propertyType) {
                                    history._content.push({
                                        _name: 'period',
                                        _attrs: {
                                            period: `${m.yearPart.toString()}${m.monthPart
                                                .toString()
                                                .padStart(2, '0')}`,
                                            periodName: DateTime.fromObject({
                                                year: m.yearPart,
                                                month: m.monthPart,
                                                day: 1
                                            }).toFormat('LLL yyyy'),
                                            totalSold: m.soldCount,
                                            averageListPrice:
                                                m.averageListPrice,
                                            averageSalePrice:
                                                m.averageSalePrice,
                                            averageDaysOnMarket:
                                                m.averageDaysOnMarket,
                                            averagePricePerSqFt:
                                                m.averagePricePerSqFt
                                        }
                                    });
                                }
                            });

                        statistics.push(history);
                    }

                    area._content.push({
                        _name: 'statistics',
                        _attrs: {
                            lookbackMonths: params.datePeriod,
                            propertyType: params.propertyType,
                            averageDaysOnMarket: propertyTypeData?.avgDOM ?? 0,
                            averageListPrice:
                                propertyTypeData?.avgListPrice ?? 0,
                            averageSalePrice:
                                propertyTypeData?.avgSalePrice ?? 0,
                            medianSalePrice:
                                propertyTypeData?.medSalePrice ?? 0,
                            activePropertyTypeCount:
                                propertyTypeData?.active ?? 0,
                            averageListPriceForSold:
                                propertyTypeData?.avgListPriceForSold ?? 0,
                            avgPricePerSqFtSold:
                                propertyTypeData?.avgPricePerSqFt ?? 0,
                            avgPricePerSqFtList:
                                propertyTypeData?.avgSoldListingsListPricePerSqFt ??
                                0,
                            soldPropertyTypeCount: propertyTypeData?.sold ?? 0,
                            taxrollCount: propertyTypeData?.taxroll ?? 0,
                            turnOver: propertyTypeData?.turnOver ?? 0,
                            maxSalePrice:
                                propertyTypeData?.maxSale?.salePrice ?? 0,
                            minSalePrice:
                                propertyTypeData?.minSale?.salePrice ?? 0,
                            marketTotalSoldVolume:
                                propertyTypeData?.marketTotalSoldVolume ?? 0,
                            averageYearsInHome:
                                propertyTypeData?.avgYearsInHome ?? 0,
                            ownerOccupancy:
                                propertyTypeData?.ownerOccupancy ?? 0
                        },
                        _content: statistics
                    });
                }
            }

            areas.push(area);
        })
    );

    return areas;
};

const listingPropertyTypeId = async params => {
    const listing = await getListing(
        params.userId,
        params.mlsNumber,
        params.mlsId
    );

    return listing.propertyTypeID;
};

const processListing = async (params, agentTimezone) => {
    let single = [];

    const listing = await getListing(
        params.userId,
        params.mlsNumber,
        params.mlsId
    );

    params.isDebug && debugLog('getListing', params, listing);

    if (listing) {
        let primaryPhoto = null;
        let listingBoundary = null;

        // Try to give options on a listing image with boundary as a fallback
        if (listing.photoPrimary && listing.photoPrimary !== '') {
            primaryPhoto = listing.photoPrimary;
        } else if (listing.listingPhotos && listing.listingPhotos.length > 0) {
            primaryPhoto = listing.listingPhotos[0];
        } else {
            // ToDO get boundary for property with no images
            // $r               = GenieAI::property_boundary();
            // $listingBoundary = 1;
        }

        // **** SINGLE LISTING
        if (listing.virtualTourUrl) {
            listing.virtualTourUrl = listing.virtualTourUrl.replaceAll(
                'http:',
                'https:'
            );

            if (listing.virtualTourUrl.indexOf('youtube.com/watch')) {
                listing.virtualTourUrl = listing.virtualTourUrl.replace(
                    /https:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)/,
                    'https://www.youtube.com/embed/$1'
                );
            }
        }

        single = [
            { mlsNumber: listing.mlsNumber ?? '' },
            { mlsId: listing.mlsID ?? '' },

            { price: listing.lowPrice ?? 0 },
            { highPrice: listing.highPrice ?? '' },
            { salePrice: listing.salePrice ?? '' },

            { listed: listing.listedOn ?? Date.now() / 1000 },
            { soldDate: listing.soldDate ?? '' },
            { daysOnMarket: listing.daysOnMarket ?? '' },

            { type: listing.propertyType },

            { listingStatus: listing.listingStatus ?? '' },
            { listingAgent: listing.listingAgentName ?? '' },
            { statusTypeID: listing.statusTypeID ?? '' },

            { description: listing.remarks ?? '' }, //ToDo clean entities?

            { photoPrimary: primaryPhoto },
            { listingBoundary: listingBoundary ?? '' },

            { squareFeet: listing.squareFeet ?? 'Enquire' },
            { lotSize: listing.lotSize ?? 'Enquire' },
            { acres: listing.acres ?? 'Enquire' },
            { built: listing.yearBuilt ?? 'Enquire' },

            { virtualTourUrl: listing.virtualTourUrl },

            { latitude: listing.latitude ?? 0 },
            { longitude: listing.longitude ?? 0 },
            { city: listing.city ?? '' }
        ];

        // *** SINGLE LISTINGAGENT
        const listingAgentContent = [];
        listingAgentContent.push({
            _name: 'listingAgent',
            _attrs: {
                count: 1,
                name: listing.listingAgentName ?? '',
                email: listing.listingAgentEmail ?? '',
                phone: listing.listingAgentPhone ?? '',

                license: listing.listingAgentStateLicense ?? '',
                broker: listing.listingBrokerName ?? ''
            }
        });

        if (
            listing.coListingAgentName !== '' ||
            listing.coListingBrokerName !== ''
        ) {
            listingAgentContent.push({
                _name: 'listingAgent',
                _attrs: {
                    count: 2,
                    name: listing.coListingAgentName ?? '',
                    email: listing.coListingAgentEmail ?? '',
                    phone: listing.coListingAgentPhone ?? '',

                    license: listing.coListingAgentStateLicense ?? '',
                    broker: listing.coListingBrokerName ?? ''
                }
            });
        }

        single.push({
            _name: 'listingAgents',
            _content: listingAgentContent
        });

        /*	Open House */
        if (params.openHouseTimes) {
            const tz = { zone: agentTimezone ?? 'PST' };
            const oh = {
                _name: 'openHouse',
                _content: []
            };

            const timeAttrbs = {
                dow: 'EEEE',
                date: 'd',
                month: 'MMMM',
                year: 'y'
            };

            for (let i = 0; i < params.openHouseTimes.length; i += 2) {
                const ts1 = params.openHouseTimes[i];
                const ts2 = params.openHouseTimes[i + 1];

                if (ts2 > NOW && ts1 < timeAgo({ days: 7 })) {
                    let session = { _name: 'session', _attrs: {} };

                    Object.keys(timeAttrbs).forEach(
                        key =>
                            (session._attrs[key] = DateTime.fromMillis(
                                ts1,
                                tz
                            ).toFormat(timeAttrbs[key]))
                    );

                    [
                        { name: 'starts', value: ts1 },
                        { name: 'ends', value: ts2 }
                    ].forEach(o => {
                        const dt = DateTime.fromMillis(o.value, tz);
                        const dtFormat = dt.minute === 0 ? 'ha' : 't';
                        session._attrs[o.name] = dt.toFormat(dtFormat);
                    });

                    session._attrs['ms'] = ts1;

                    oh._content.push(session);
                }
            }

            single.push(oh);
        }

        single.push({
            _name: 'bedrooms',
            _attrs: { count: listing?.bedrooms || 'n/a' }
        });
        single.push({
            _name: 'bathrooms',
            _attrs: {
                total: listing.totalBathrooms,
                full: listing.bathroomsFull,
                half: listing.bathroomsHalf
            }
        });
        single.push({
            _name: 'parking',
            _attrs: {
                spaces: listing.parkingSpaces,
                garage: listing.garageSpaces
            }
        });

        // *** SINGLE ADDRESS
        single.push({
            _name: 'address',
            _content: [
                { streetNumber: listing.streetNumber ?? '' },
                { unitNumber: listing.unitNumber ?? '' },
                { street: listing.listingAddress ?? '' },
                { city: listing.city ?? '' },
                { state: listing.state ?? '' },
                { zip: listing.zip ?? '' },
                {
                    streetName:
                        listing.streetName ?? listing.listingAddress ?? ''
                }
            ]
        });

        const dimensions = [];
        listing?.roomDimensions.forEach(d =>
            dimensions.push({
                _name: 'room',
                _attrs: {
                    name: d.key,
                    size: d.value
                }
            })
        );
        dimensions.length &&
            single.push({ _name: 'dimensions', _content: dimensions });

        const features = [];
        listing?.features.forEach(f =>
            features.push({
                _name: 'feature',
                _attrs: {
                    category: f.key,
                    description: f.value
                }
            })
        );
        features.length &&
            single.push({ _name: 'features', _content: features });

        const images = [];
        listing?.listingPhotos.forEach(src => {
            if (src.substring(0, 2) == '//') {
                src = `https:${src}`;
            }
            images.push({
                _name: 'image',
                _attrs: { src }
            });
        });
        images.length && single.push({ _name: 'images', _content: images });
    }

    return single;
};

const processCollection = async params => {
    const collectionData = await jsonFromS3(
        `genie-tools/collections/${params.collection}.json`
    );

    if (collectionData) {
        const collection = {
            _attrs: {
                id: params.renderId,
                name: collectionData.name,
                template: collectionData.template,
                assembled: Math.round(Date.now() / 1000)
            }
        };

        const sections = [];

        await Promise.all(
            Object.keys(collectionData.sections).map(async (key, i) => {
                const sectionData = collectionData.sections[key];
                const meta = sectionData.meta ?? {};
                const caption = meta.caption ?? '';
                const description = meta.description ?? '';

                const section = {
                    _name: 'section',
                    _attrs: {
                        name: sectionData.name || `Section ${i + 1}`,
                        caption: caption,
                        description: description,
                        sort: parseInt(sectionData?.sort ?? 1)
                    },
                    _content: []
                };

                await Promise.all(
                    sectionData.assets.map(async asset => {
                        if (!asset.hide) {
                            const assetData = await assetSetting(
                                asset.asset,
                                'all'
                            );

                            if (Object.keys(assetData).length > 0) {
                                const size =
                                    asset.size ??
                                    (Array.isArray(assetData?.sizes) &&
                                        assetData.sizes[0]) ??
                                    DEFAULT_SIZE;
                                let qrUrl = asset.qrDestination ?? null;

                                const { s3Key } = await getS3Key(asset.asset, {
                                    ...params,
                                    lpo: asset.lpo
                                });

                                const tags = Array.isArray(assetData?.tags)
                                    ? assetData?.tags?.map(tag => ({
                                          _name: 'tag',
                                          _attrs: { name: tag.trim() }
                                      }))
                                    : null;

                                const _attrs = {
                                    stylesheet: asset.asset,
                                    size: size,
                                    sort: parseInt( asset.sort ),
                                    name:
                                        asset.name ??
                                        asset.knownAs ??
                                        assetData.name,
                                    version: assetData.version ?? 1,
                                    renderKey: s3Key,
                                    qrUrl
                                };

                                if ( assetData.pages?.length ) {
                                    _attrs.pageCount = assetData.pages.length;
                                }

                                section._content.push({
                                    _name: 'asset',
                                    _attrs,
                                    _content: tags
                                });
                            }
                        }
                    })
                );

                sections.push(section);
            })
        );

        collection.sections = sections;

        if (params.collection.docs) {
            const docs_el = [];

            params.collection.docs.forEach((docFolder, index) => {
                const folder = {
                    _name: 'folder',
                    _attrs: {
                        name: index
                    },
                    _content: []
                };

                docFolder.forEach(doc => {
                    folder._content.push({
                        _name: 'doc',
                        _attrs: {
                            name: doc.name,
                            link: doc.url
                        },
                        _content: [
                            {
                                _name: 'image',
                                _attrs: {
                                    src: () => {
                                        switch (doc.type) {
                                            case 'xls':
                                            case 'xlsx':
                                                return '{$pluginUrl}assets/listing-commands/img/icon-xls.png';
                                            case 'pdf':
                                                return '{$pluginUrl}assets/listing-commands/img/icon-pdf.png';
                                            case 'doc':
                                            case 'docx':
                                                return '{$pluginUrl}assets/listing-commands/img/icon-doc.png';

                                            default:
                                                return '{$pluginUrl}assets/listing-commands/img/icon-file.png';
                                        }
                                    },
                                    class: 'icon'
                                }
                            }
                        ]
                    });
                });

                docs_el.push(folder);
            });

            collection.push({ _name: 'additionalDocs', _content: docs_el });
        }

        if (params.areaIds.length) {
            // ToDo? support more than just the first area?
            /*
			const searches = savedSearches(params.userId, params.areaIds[0]);
			if (searches.savedSearches) {
				const files = [];

				searches.savedSearches.forEach(search =>
					search.availableFiles.forEach(file =>
						files.push({
							_name: "file",
							_attrs: {
								_name: file.fileName,
								link: file.downLoadLink,
								fileRecordCount: file.fileRecordCount,
							},
						})
					)
				);

				collection.push({ _name: "targetFiles", _content: files });
			}*/
        }

        return collection;
    }
};

export const buildVersion = async () =>
    (await listS3Folder('_assets/landing-pages/dist'))
        .pop()
        .Key.replace('_assets/landing-pages/dist/', '')
        .split('/')
        .shift();

const debugLog = async (source, params, data) => {
    console.log('debugLog', source, params, data);
};

export const preCallGenieAPIs = async params => {
    try {
        if (params.mlsNumber) {
            await openhouseByMlsNumber(params.mlsId, params.mlsNumber);

            await propertySurroundingAreas(
                params.mlsNumber,
                params.mlsId,
                params.userId
            );

            await agentProperties(params.userId, false);

            await areaFromMlsNumber(
                params.mlsNumber,
                params.mlsId,
                params.userId
            );

            await getListing(params.userId, params.mlsNumber, params.mlsId);
        }

        if (Array.isArray(params?.agentIds)) {
            await Promise.all(
                params.agentIds.map(async agentId => await getUser(agentId))
            );
        }

        if (Array.isArray(params?.areaIds)) {
            await Promise.all(
                params.areaIds.map(async areaId => {
                    await getAreaBoundary(areaId);

                    await areaStatisticsWithPrevious(
                        params.userId,
                        areaId,
                        parseInt(params.datePeriod || 12)
                    );
                    // **** LISTINGS
                    await mlsProperties(
                        params.mlsId ?? 0,
                        areaId,
                        NOW.plus({ months: params.datePeriod * -1 }).toISO()
                    );

                    await agentMlsNumbers(params.userId);

                    await areaStatisticsMonthly(
                        params.userId,
                        areaId,
                        Math.ceil(params.datePeriod / 12)
                    );
                })
            );
        }

        return true;
    } catch (err) {
        console.log('precache error', err);
        return false;
    }
};
