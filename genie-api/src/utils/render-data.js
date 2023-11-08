import { DateTime } from "luxon";
// prettier-ignore
import {
	generateQR,
	currencyFormat,
	endOfLastMonth,
	genieGlobals,
	MINUTE_IN_SECONDS,
	NOW,
	dateAdd,
	timeAgo,
	toS3,
	jsonFromS3,
	listS3Folder,
	assetSetting,
} from "./index.js";
// prettier-ignore
import {  areaName,openhouseByMlsNumber, getListing, agentProperties, mlsProperties, areaStatisticsMonthly, areaStatisticsWithPrevious, propertySurroundingAreas, getUser, getAreaBoundary, mlsDisplaySettings, } from "./../genieAI.js";
import { getS3Key } from "../index.js";

export const getRenderJSON = async params => {
	if (typeof params != "object" || Object.keys(params).length == 0) {
		throw new Exception("Empty render param set is not supported");
	}

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
			warning: `Forced propertyType switch from ${params.propertyType} to ${propertyTypeId}.`,
		});
		params.propertyType = propertyTypeId;
	}

	let renderSettings = filteredMerge(defaultRenderSettings, params);

	// Specials
	if (params.downloadUrl) {
		renderSettings.downloadUrl = params.downloadUrl;
	}

	const periodFormat = "LLL `yy";

	const root = {
		// *** Output
		output: {
			_attrs: await processOutput(
				params.userId,
				params.datePeriod,
				params.renderId,
				renderSettings
			),
		},

		// *** Dates
		date: {
			_attrs: {
				period:
					dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
						months: -params.datePeriod,
					}).toFormat(periodFormat) +
					" to " +
					DateTime.fromMillis(params.offsetDate).toFormat(periodFormat),

				previousPeriod:
					dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
						months: -datePeriod2,
					}).toFormat(periodFormat) +
					" to " +
					dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
						months: -params.datePeriod,
					}).toFormat(periodFormat),
			},
		},

		// *** Overrides
		overrides: params.customizations
			? processCustomizations(params.customizations)
			: {},

		// *** Agents
		agents: await processAgents([
			params.userId,
			...(params?.renderSettings?.additionalAgents ?? []),
		]),

		// *** Areas
		areas: params.isEmbed
			? params.areaIds.map(id => ({ id }))
			: await processAreas(params),
	};

	// Slightly weird place for this code, but...generate QR image
	let qrUrl =
		params.qrCode ??
		(params.customizations?.qrUrl || root.agents[0].agent.website) ??
		"";

	if (qrUrl == "skip") {
		root.output._attrs.qrUrl = "skip";
	} else if (qrUrl && qrUrl !== "") {
		if (!qrUrl.startsWith("http")) qrUrl = `https://${qrUrl}`;
		const qrSVG = await generateQR(decodeURI(qrUrl));

		await toS3(
			`genie-files/${params.renderId}/qr.svg`,
			Buffer.from(qrSVG),
			null,
			"image/svg+xml"
		);

		root.output._attrs.qrUrl = `${genieGlobals.GENIE_HOST}genie-files/${params.renderId}/qr.svg`;
	}

	if (params.mlsNumber) {
		// ** OPEN HOUSE TIMES
		let times = [];

		if (params.openHouseTimes) {
			params.openHouseTimes.forEach(t => {
				// Support timestamps and formatted date/time strings
				times.push(typeof t == "string" ? DateTime.fromISO(t) : t);
			});
		} else {
			const r = await openhouseByMlsNumber(params.mlsId, params.mlsNumber);
			if (r.openHouses && Array.isArray(r.openHouses)) {
				r.openHouses.forEach(t => {
					times.push(DateTime.fromISO(t.startDateUtc).toMillis());
					times.push(DateTime.fromISO(t.endDateUtc).toMillis());
				});
			}
		}
		params.openHouseTimes = times;

		root.single = await processListing(params);

		let mlsDisplay = await mlsDisplaySettings(params.mlsId ?? 0);

		if (mlsDisplay) {
			/* TODO!
			let html_node = Utilities.html_2_xml(
				mlsDisplay.mlsGroupDisplaySettings.listingPageDisclaimer,
				"disclaimer"
			);
			*/
			//			console.log("mlsDisplay", mlsDisplay);
			root.mlsDisplay = `<![CDATA[${
				mlsDisplay?.mlsGroupDisplaySettings?.listingPageDisclaimer ?? ""
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
		...renderSettings,
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
	size: "facebook",
	theme: "_default-light",
	additionalAgents: null,
	propertyType: 0,
	mapStyle: "satellite-streets-v9",
	mapIcon: "dot",
	mapKey: false,
	pricePercent: "percent",
	listingStatus: "all",
	listingCount: "10",
	withBleed: false,
	withCrops: false,
	blurPrice: false,
	hideAVM: false,
	requireSignin: false,
	customerName: null,
	isLeadCapture: false,
	downloadUrl: "",
	openHouseTimes: null,
	propertyCaption: null,
	propertyCaptionSingular: null,
	reRenderUntil: null,
};

export const areaFromMlsNumber = async (mlsNumber, mlsId, userId) => {
	const listing = await getListing(userId, mlsNumber, mlsId);

	//console.log("areaFromMlsNumber 1,", mlsNumber, userId);
	if (listing.preferredAreaId) {
		//console.log("areaFromMlsNumber 2,", listing.preferredAreaId);
		return await areaName(userId, listing.preferredAreaId);
	}

	const areas = await propertySurroundingAreas(mlsNumber, mlsId, userId);

	//console.log("areaFromMlsNumber 3", areas);

	if (Array.isArray(areas) && areas.length > 0) {
		const limitApnCount = area =>
			area.areaApnCount >= 1000 && area.areaApnCount <= 3000;

		let subset = areas.filter(
			area =>
				!["City", "CarrierRoute", "School"].includes(area.areaType) &&
				limitApnCount(area)
		);

		if (subset && subset.length) {
			//console.log("areaFromMlsNumber 4", subset[0]);
			return subset[0];
		} else {
			subset = areas.filter(limitApnCount);

			if (subset && subset.length) {
				//console.log("areaFromMlsNumber 5", subset[0]);
				return subset[0];
			} else {
				let a = areas.pop();
				//	console.log("areaFromMlsNumber 6", a);
				return a;
			}
		}
	}

	//console.log("areaFromMlsNumber 10");
};

const agentMlsNumbers = async userId => {
	const r = await agentProperties(userId, false);

	return r.properties.map(p => p.mlsNumber);
};

const singleAddress = listing => {
	let address = `${listing.streetNumber} ${listing.streetName}`;

	if (listing.unitNumber && listing.unitNumber !== "") {
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
		}
	}

	return params;
};

export const userSetting = async (userId, setting) => {
	const user = await getUser(userId);

	switch (setting) {
		case "theme":
			return user.marketingSettings.profile.defaultTheme;
	}
};

const processAgents = async agentIds => {
	let agents = [];

	Promise.all(
		agentIds.map(async agentID => {
			const profile = await getUser(agentID);

			const marketingSettings = profile.marketingSettings;

			const findImage = id => {
				const image = marketingSettings.images.find(
					img => img.marketingImageTypeId == id
				);

				return image ? image.url : "";
			};

			const getDisclaimer = id => {
				const disclaimer = marketingSettings.disclaimers.find(
					d => d.marketingDisclaimerTypeId == id
				);

				return (
					disclaimer ?? {
						text: "",
						url: "",
					}
				);
			};

			let timezone;
			switch (marketingSettings.profile?.timeZoneId) {
				case 4:
				default:
					timezone = "PT";
					break;
			}
			let about = (marketingSettings.profile.about ?? "").replaceAll(
				"\r\n",
				"&#10;"
			);

			const agent = {
				firstName: profile.firstName,
				lastName: profile.lastName,
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
				marketingLicense: marketingSettings.profile.licenseNumber ?? null,

				privacySource: getDisclaimer(1).url, // "privacy_source"
				privacyPolicy: getDisclaimer(1).text, // "privacy_text"
				disclaimerOptin: getDisclaimer(2).text, // "optin"
				disclaimerExtra: getDisclaimer(4).text, //"htmlDisclaimer"
				disclaimerIDX: getDisclaimer(3).text, // "idxDisclaimer"

				pronoun: marketingSettings.profile.isTeam ? "plural" : "singular",
				timezone,

				mobile: marketingSettings.profile.phone ?? null,
				website: marketingSettings.profile.websiteUrl ?? null,
				email: marketingSettings.profile.email,
				agentId: agentID,

				// *** AGENT ADDRESS
				address: {
					company: marketingSettings.office.name ?? "",
					street: marketingSettings.office.address ?? "",
					address2: marketingSettings.office.address2 ?? "",
					city: marketingSettings.office.city ?? "",
					state: marketingSettings.office.state ?? "",
					zip: marketingSettings.office.zip ?? "",
				},
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

		if (typeof content == "object") {
			overrides.push({ _name: key, _content: content });
		} else if (typeof content == "string") {
			overrides.push({ _name: key, _content: content });
		}
	});

	return overrides;
};

const processAreas = async params => {
	const areas = [];

	await Promise.all(
		params.areaIds.map(async areaId => {
			const range = [0, 0, 0];
			const boundary = await getAreaBoundary(areaId);
			const statsData = await areaStatisticsWithPrevious(
				params.userId,
				areaId,
				params.datePeriod
			);

			params.isDebug &&
				debugLog("areaStatisticsWithPrevious", params, statsData);

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
				_name: "area",
				_content: [
					{ id: areaId },
					{ name: areaName ?? params?.area?.name ?? "NOT SET" },
					{ geojson: `<![CDATA[${geoJSON}]]>` },
					{ centerLat: boundary?.mapArea?.centerLatitude ?? 32.71 },
					{ centerLng: boundary?.mapArea?.centerLongitude ?? -117.16 },
					{ image: areaImage ?? "" },
				],
			};

			if (statsData.statistics) {
				let propertyTypeData, prevData, lowerByValue, upperByValue;

				statsData.statistics.propertyTypeData.forEach(pData => {
					if (pData.type == (params.propertyType ?? 0)) {
						propertyTypeData = pData.statistics;
						prevData = propertyTypeData.previousPeriod;
					}
				});

				if (propertyTypeData) {
					// Split median/lower and median/highest
					lowerByValue =
						propertyTypeData.minSale.salePrice +
						(propertyTypeData.medSalePrice -
							propertyTypeData.minSale.salePrice) /
							2;
					upperByValue =
						propertyTypeData.maxSale.salePrice -
						(propertyTypeData.maxSale.salePrice -
							propertyTypeData.medSalePrice) /
							1.25;
					lowerByValue = Math.floor(
						parseFloat(lowerByValue) +
							(25000 - (parseFloat(lowerByValue) % 25000))
					);
					upperByValue = Math.floor(
						parseFloat(upperByValue) +
							(25000 - (parseFloat(upperByValue) % 25000))
					);
				}

				// **** LISTINGS
				const mls_properties = await mlsProperties(
					params.mlsID ?? 0,
					areaId,
					NOW.plus({ months: params.datePeriod * -1 }).toISO()
				);

				params.isDebug && debugLog("mlsProperties", params, mls_properties);

				if (mls_properties && Array.isArray(mls_properties)) {
					const agentListings = await agentMlsNumbers(params.userId);
					const listings = [];

					mls_properties.sort((a, b) => {
						if (
							agentListings.includes(a.mlsNumber) ===
							agentListings.includes(b.mlsNumber)
						) {
							const aDate = DateTime.fromISO(a.soldDate ?? a.listDate);
							const bDate = DateTime.fromISO(b.soldDate ?? b.listDate);

							return aDate === bDate ? 0 : aDate < bDate ? 1 : -1;
						} else {
							return agentListings.includes(a.mlsNumber) ? 1 : -1;
						}
					});

					mls_properties.forEach(p => {
						if (
							p.propertyTypeID ==
							(params.propertyType ?? params.propertyTypeID ?? 0)
						) {
							const state =
								parseInt(p.statusTypeID) == 4 || parseInt(p.statusTypeID) == 12
									? "pending"
									: p.statusType.toLowerCase();

							listings.push({
								_name: "listing",
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
									listedDate: DateTime.fromISO(p.listDate).toSeconds(),
									soldDate: p.soldDate
										? DateTime.fromISO(p.soldDate).toSeconds()
										: null,
									dom: p.daysOnMarket,
									thumb: p.photoPrimaryUrl,
								},
							});

							if (p?.salePrice) {
								if (parseInt(p.salePrice) <= lowerByValue) {
									range[0]++;
								} else if (parseInt(p.salePrice) >= upperByValue) {
									range[2]++;
								} else {
									range[1]++;
								}
							}
						}
					});
					area._content.push({ _name: "listings", _content: listings });

					const statistics = [
						{
							_name: "previous",
							_attrs: {
								totalSold: prevData?.sold,
								turnOver: prevData?.turnOver,
								avgPricePerSqFtSold: prevData?.avgPricePerSqFt,
								avgPricePerSqFtList: prevData?.avgSoldListingsListPricePerSqFt,
								averageListPriceForSold: prevData?.avgListPriceForSold,
								averageSalePrice: prevData?.avgSalePrice,
								averageDaysOnMarket: prevData?.avgDaysOnMarket,
								medianSalePrice: prevData.medSalePrice,
								maxSalePrice: prevData?.maxSale?.salePrice,
								minSalePrice: prevData?.minSale?.salePrice,
							},
						},
					];

					// *** BY BEDROOM
					const byBedroom = { _name: "byBedroom", _content: [] };
					propertyTypeData.bedroomStats.forEach(stat => {
						byBedroom._content.push({
							_name: "bedroom",
							_attrs: {
								number: stat.beds,
								sold: stat.sold,
								active: stat.active,
								pending: stat.pending,
								averageSalePrice: stat.avgSalePrice,
								averageListPrice: stat.avgListPrice,
								averageListPriceForSold: stat.avgListPriceForSold,
							},
						});
					});
					statistics.push(byBedroom);

					// *** BY SIZE
					const bySize = { _name: "bySize", _content: [] };
					propertyTypeData.squareFootStats.forEach(stat => {
						bySize._content.push({
							_name: "size",
							_attrs: {
								min: stat.min,
								max: stat.max,
								sold: stat.sold,
								active: stat.active,
								pending: stat.pending,
								averageSalePrice: stat.avgSalePrice,
								averageListPrice: stat.avgListPrice,
								averageListPriceForSold: stat.avgListPriceForSold,
							},
						});
					});
					statistics.push(bySize);

					// *** BY QUARTILE
					const monthly = areaStatisticsMonthly(
						params.userId,
						areaId,
						Math.ceil(params.datePeriod / 12)
					);
					if (monthly.statistics) {
						const history = { _name: "history", _content: [] };
						// Only take what we need -( NB: datePeriod * 2 because both property types are in there)
						monthly.statistics
							.slice((params.datePeriod + 1) * 2 * -1)
							.forEach(m => {
								if (m.propertyTypeId == params.propertyType) {
									history._content.push({
										_name: "period",
										_attrs: {
											period: m.yearPart.str_pad(
												m.monthPart,
												2,
												"0",
												STR_PAD_LEFT
											),
											periodName: DateTime.fromObject({
												year: m.yearPart,
												month: m.monthPart,
												day: 1,
											}).toFormat("LLL yyyy"),
											totalSold: m.soldCount,
											averageListPrice: m.averageListPrice,
											averageSalePrice: m.averageSalePrice,
											averageDaysOnMarket: m.averageDaysOnMarket,
											averagePricePerSqFt: m.averagePricePerSqFt,
										},
									});
								}
							});

						statistics.push(history);
					}

					// *** BY VALUE
					const lowerAsDollars = currencyFormat(lowerByValue);
					const upperAsDollars = currencyFormat(upperByValue);

					const byValue = { _name: "byValue", _content: [] };
					[
						`${lowerAsDollars}`,
						`${lowerAsDollars} / ${upperAsDollars}`,
						`${upperAsDollars}`,
					].forEach((value, index) =>
						byValue._content.push({
							_name: "range",
							_attrs: {
								value,
								sold: range[index],
							},
						})
					);
					statistics.push(byValue);

					area._content.push({
						_name: "statistics",
						_attrs: {
							lookbackMonths: params.datePeriod,
							propertyType: params.propertyType,
							averageDaysOnMarket: propertyTypeData.avgDOM,
							averageListPrice: propertyTypeData.avgListPrice,
							averageSalePrice: propertyTypeData.avgSalePrice,
							medianSalePrice: propertyTypeData.medSalePrice,
							activePropertyTypeCount: propertyTypeData.active,
							averageListPriceForSold: propertyTypeData.avgListPriceForSold,
							avgPricePerSqFtSold: propertyTypeData.avgPricePerSqFt,
							avgPricePerSqFtList:
								propertyTypeData.avgSoldListingsListPricePerSqFt,
							soldPropertyTypeCount: propertyTypeData.sold,
							taxrollCount: propertyTypeData.taxroll,
							turnOver: propertyTypeData.turnOver,
							maxSalePrice: propertyTypeData?.maxSale?.salePrice,
							minSalePrice: propertyTypeData?.minSale?.salePrice,
							marketTotalSoldVolume: propertyTypeData?.marketTotalSoldVolume,
							averageYearsInHome: propertyTypeData?.avgYearsInHome,
							ownerOccupancy: propertyTypeData?.ownerOccupancy,
						},
						_content: statistics,
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

const processListing = async params => {
	let single = [];

	const listing = await getListing(
		params.userId,
		params.mlsNumber,
		params.mlsId
	);

	params.isDebug && debugLog("getListing", params, listing);

	if (listing) {
		let primaryPhoto = null;
		let listingBoundary = null;

		// Try to give options on a listing image with boundary as a fallback
		if (listing.photoPrimary && listing.photoPrimary !== "") {
			primaryPhoto = listing.photoPrimary;
		} else if (listing.listingPhotos && listing.listingPhotos.length > 0) {
			primaryPhoto = listing.listingPhotos[0];
		} else {
			// ToDO get boundary for property with no images
			// $r               = GenieAI::property_boundary();
			// $listingBoundary = 1;
		}

		// **** SINGLE LISTING
		single = [
			{ mlsNumber: listing.mlsNumber ?? "" },
			{ mlsID: listing.mlsID ?? "" },

			{ price: listing.lowPrice ?? 0 },
			{ highPrice: listing.highPrice ?? "" },
			{ salePrice: listing.salePrice ?? "" },

			{ listed: listing.listedOn ?? Date.now() / 1000 },
			{ soldDate: listing.soldDate ?? "" },
			{ daysOnMarket: listing.daysOnMarket ?? "" },

			{ type: listing.propertyType },

			{ listingStatus: listing.listingStatus ?? "" },
			{ listingAgent: listing.listingAgentName ?? "" },
			{ statusTypeID: listing.statusTypeID ?? "" },

			{ description: listing.remarks ?? "" }, //ToDo clean entities?

			{ photoPrimary: primaryPhoto },
			{ listingBoundary: listingBoundary ?? "" },

			{ squareFeet: listing.squareFeet ?? "Enquire" },
			{ lotSize: listing.lotSize ?? "Enquire" },
			{ acres: listing.acres ?? "Enquire" },
			{ built: listing.yearBuilt ?? "Enquire" },

			{
				virtualTourUrl: (listing.virtualTourUrl ?? "").replaceAll(
					"http:",
					"https:"
				),
			},

			{ latitude: listing.latitude ?? 0 },
			{ longitude: listing.longitude ?? 0 },
			{ city: listing.city ?? "" },
		];

		/*	Open House */
		if (params.openHouseTimes) {
			//$tz = new DateTimeZone(Users.timezone(userId));
			const tz = { zone: "PST" };
			const oh = {
				_name: "openHouse",
				_content: [],
			};

			const timeAttrbs = {
				dow: "EEEE",
				date: "d",
				month: "MMMM",
				year: "y",
				starts: "t",
			};

			for (let i = 0; i < params.openHouseTimes.length; i += 2) {
				const ts1 = params.openHouseTimes[i];
				const ts2 = params.openHouseTimes[i + 1];

				if (ts2 > NOW && ts1 < timeAgo({ days: 7 })) {
					let session = { _name: "session", _attrs: {} };

					Object.keys(timeAttrbs).forEach(
						key =>
							(session._attrs[key] = DateTime.fromMillis(ts1, tz).toFormat(
								timeAttrbs[key]
							))
					);
					session._attrs["ends"] = DateTime.fromMillis(ts2, tz).toFormat("t");

					oh._content.push(session);
				}
			}

			single.push(oh);
		}

		single.push({
			_name: "bedrooms",
			_attrs: { count: listing?.bedrooms || "n/a" },
		});
		single.push({
			_name: "bathrooms",
			_attrs: {
				full: listing.bathroomsFull,
				half: listing.bathroomsHalf,
			},
		});
		single.push({
			_name: "parking",
			_attrs: {
				spaces: listing.parkingSpaces,
				garage: listing.garageSpaces,
			},
		});

		// *** SINGLE ADDRESS
		single.push({
			_name: "address",
			_content: [
				{ streetNumber: listing.streetNumber ?? "" },
				{ unitNumber: listing.unitNumber ?? "" },
				{ street: listing.listingAddress ?? "" },
				{ city: listing.city ?? "" },
				{ state: listing.state ?? "" },
				{ zip: listing.zip ?? "" },
				{ streetName: listing.streetName ?? listing.listingAddress ?? "" },
			],
		});

		const dimensions = [];
		listing?.roomDimensions.forEach(d =>
			dimensions.push({
				_name: "room",
				_attrs: {
					name: d.key,
					size: d.value,
				},
			})
		);
		dimensions.length &&
			single.push({ _name: "dimensions", _content: dimensions });

		const features = [];
		listing?.features.forEach(f =>
			features.push({
				_name: "feature",
				_attrs: {
					category: f.key,
					description: f.value,
				},
			})
		);
		features.length && single.push({ _name: "features", _content: features });

		const images = [];
		listing?.listingPhotos.forEach(src => {
			if (src.substring(0, 2) == "//") {
				src = `https:${src}`;
			}
			images.push({
				_name: "image",
				_attrs: { src },
			});
		});
		images.length && single.push({ _name: "images", _content: images });
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
				file: params.collection.file,
				title: params.collection.title,
				assembled: Date.now() / 1000,
			},
		};

		const sections = [];

		await Promise.all(
			Object.keys(collectionData.sections).map(async (key, i) => {
				const sectionData = collectionData.sections[key];
				const meta = sectionData.meta ?? {};
				const caption = meta.caption ?? "";
				const description = meta.description ?? "";

				const section = {
					_name: "section",
					_attrs: {
						name: sectionData.name || `Section ${i + 1}`,
						caption: caption,
						description: description,
					},
					_content: [],
				};

				await Promise.all(
					sectionData.assets.map(async asset => {
						if (!asset.hide) {
							const assetData = await assetSetting(asset.asset, "all");

							if (Object.keys(assetData).length > 0) {
								const size =
									asset.size ??
									(Array.isArray(assetData?.sizes) && assetData.sizes[0]) ??
									DEFAULT_SIZE;
								let qrUrl = asset.qrDestination ?? null;

								if (!qrUrl && asset.qrUrl) {
									const linkAsset = collectionData.sections.map(async section =>
										section.assets.find(
											async a =>
												a.asset?.startsWith("landing-pages") &&
												a.asset == asset.qrUrl
										)
									);

									if (linkAsset) {
										/*
										const rdata = get_collection_render_data(
											linkAsset,
											params.renderId
										);
	
										if (rdata?.id) {
											qrUrl = get_asset_landing_link(linkAsset, rdata.id);
										}*/
									}
								}

								const { s3Key } = await getS3Key(asset.asset, {
									...params,
									lpo: asset.lpo,
								});

								const tags = Array.isArray(assetData?.tags)
									? assetData?.tags?.map(tag => ({
											_name: "tag",
											_attrs: { name: tag.trim() },
									  }))
									: null;

								section._content.push({
									_name: "asset",
									_attrs: {
										stylesheet: asset.asset,
										size: size,
										name: asset.name ?? asset.knownAs ?? assetData.name,
										version: assetData.version ?? 1,
										renderKey: s3Key,
										qrUrl,
									},
									_content: tags,
								});
							}
							// ToDo } else if (asset_file) {
							// Only log errors for files that actually exist
							// TODO error_log('Collection Render Data failed: ' . $collection_id);
							// TODO error_log(print_r($asset, true));
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
					_name: "folder",
					_attrs: {
						name: index,
					},
					_content: [],
				};

				docFolder.forEach(doc => {
					folder._content.push({
						_name: "doc",
						_attrs: {
							name: doc.name,
							link: doc.url,
						},
						_content: [
							{
								_name: "image",
								_attrs: {
									src: () => {
										switch (doc.type) {
											case "xls":
											case "xlsx":
												return "{$pluginUrl}assets/listing-commands/img/icon-xls.png";
											case "pdf":
												return "{$pluginUrl}assets/listing-commands/img/icon-pdf.png";
											case "doc":
											case "docx":
												return "{$pluginUrl}assets/listing-commands/img/icon-doc.png";

											default:
												return "{$pluginUrl}assets/listing-commands/img/icon-file.png";
										}
									},
									class: "icon",
								},
							},
						],
					});
				});

				docs_el.push(folder);
			});

			collection.push({ _name: "additionalDocs", _content: docs_el });
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

const buildVersion = async () => {
	const files = await listS3Folder("_assets/landing-pages/dist");

	return files
		.pop()
		.Key.replace("_assets/landing-pages/dist/", "")
		.split("/")
		.shift();
};

const debugLog = async (source, params, data) => {
	console.log("debugLog", source, params, data);
};