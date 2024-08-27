import {
	createResource,
	createSignal,
	createEffect,
	createContext,
	onMount,
} from "solid-js";
import { createStore } from "solid-js/store";
import { differenceInHours } from "date-fns";

import { getAreaMonthly, getAgentData } from "./rest";
import { sharedEmbedStore, setSharedEmbedStore } from "./state";

export const Context4Settings = createContext();

export const twoDigitMonth = month => ("0" + (month + 1)).slice(-2);

export const timestampFormat = (timestamp, format = null) =>
	dateFormat(new Date(timestamp * 1000), format);

export const dateFormat = (
	d,
	format = { month: "2-digit", day: "2-digit", year: "numeric" }
) => new Intl.DateTimeFormat("en-US", format).format(d);

export const clientTimeZone = () =>
	Intl.DateTimeFormat().resolvedOptions().timeZone;

export const currency = n =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

export const percent = n =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 2,
		minimumFractionDigits: 2,
	}).format(n);

export const number = n =>
	new Intl.NumberFormat("en-US", {
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

export const getCssVar = (name, el) =>
	getComputedStyle(el ?? document.body).getPropertyValue(name);

export const hex2rgba = (hex, alpha = 1) => {
	const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
	const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
	return `rgba(${r},${g},${b},${alpha})`;
};

export const address = listing =>
	`${listing.streetNumber} ${listing.streetName}`;

export const signedInAtom = () => {};

export const periodName = period =>
	`${period} ${period > 1 ? "months" : "month"}`;

export const usePagination = (size = 10, page = 1) => {
	const [pageSize, setPageSize] = createSignal(size);
	const [currentPage, setPage] = createSignal(page);
	const pageOffset = () => (currentPage() - 1) * pageSize();

	return {
		pageSize,
		setPageSize,
		currentPage,
		setPage,
		pageOffset,
	};
};

export const useSettings = settingsContext => {
	const globalSettings = typeof window.gHub !== "undefined" ? window.gHub : {};
	const settings = { ...globalSettings, ...settingsContext };

	onMount(() => {
		if (settings.areaPeriod) {
			setSharedEmbedStore({ period: parseInt(settings.areaPeriod) });
		}
	});

	const keyModify = s => s.toLowerCase().replaceAll("_", "");
	Object.keys(settings).forEach(
		oldKey =>
			delete Object.assign(settings, {
				[keyModify(oldKey)]: settings[oldKey],
			})[oldKey]
	);

	const sessionSettings = new Proxy(settings, {
		get(target, prop) {
			return target[keyModify(prop)];
		},
		set(target, prop, value) {
			return Reflect.set(target, keyModify(prop), value);
		},
	});

	return sessionSettings;
};

export const filterListings = (
	listings,
	propertyTypeID,
	period,
	mode = "active",
	sortBy
) => {
	let subset, descending;
	const timeCutOff = new Date();
	timeCutOff.setMonth(timeCutOff.getMonth() - period);
	const now = new Date();

	switch (mode.toString().toLocaleLowerCase()) {
		case "sold":
			descending = (l1, l2) => {
				const a = Date.parse(l1.soldDate);
				const b = Date.parse(l2.soldDate);

				return a < b ? 1 : a > b ? -1 : 0;
			};
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === "sold" &&
					p.propertyTypeID === propertyTypeID &&
					p.soldDate !== null &&
					Date.parse(p.soldDate) >= timeCutOff.getTime()
			);
			break;

		case "new":
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === "active" &&
					Math.floor(differenceInHours(Date.parse(p.listDate), now) / 24) >
						-30 &&
					p.propertyTypeID === propertyTypeID
			);

			descending = (l1, l2) => {
				const a = Date.parse(l1.listDate);
				const b = Date.parse(l2.listDate);

				return a > b ? -1 : a < b ? 1 : 0;
			};
			break;

		case "pending":
			descending = (l1, l2) => {
				const a = Date.parse(l1.listDate);
				const b = Date.parse(l2.listDate);

				return a < b ? 1 : a > b ? -1 : 0;
			};
			subset = listings.filter(
				p =>
					(p.statusType.toLowerCase() === "pending" ||
						p.statusType.toLowerCase() === "contingent") &&
					p.propertyTypeID === propertyTypeID
			);
			break;

		case "active":
		default:
			descending = (l1, l2) => {
				const a = Date.parse(l1.listDate);
				const b = Date.parse(l2.listDate);

				return a < b ? 1 : a > b ? -1 : 0;
			};
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === mode.toLowerCase() &&
					p.propertyTypeID === propertyTypeID
			);
			break;
	}

	subset.sort(descending);

	return subset;
};

export const useAreaMonthly = () => {
	const settings = useSettings(Context4Settings);
	const [store, setStore] = createStore({
		loading: true,
	});

	const [areaData] = createResource(settings.areaId, async areaId =>
		getAreaMonthly(areaId, settings.agentId)
	);

	createEffect(() => {
		if (!areaData.loading) {
			setStore({
				areaName: areaData().areaName,
				monthly: areaData().stats.filter(
					s => s.propertyTypeId === sharedEmbedStore.propertyType
				),
				propertyTypeID: sharedEmbedStore.propertyType,
				areaId: settings.areaId,
				areaPeriod: sharedEmbedStore.period,
				loading: false,
			});
		}
	});

	return store;
};

export const useAgentData = () => {
	const { agentId } = useSettings(Context4Settings);
	const [agent] = createResource(agentId, getAgentData);

	return agent;
};

export const addDynamicPopup = (popupId) => {  
  if (document.getElementById(popupId))
    return false; //already exists

  document.body.classList.add("hasPopup");
  const div = document.createElement("div");
  div.id = popupId;
  div.classList.add("popup-dialog", "visible");
  document.body.appendChild(div);
  return true;
};

//TODO: I think we can expose api endpoint that will deliver options but just mocking till we have a clear plan
export const getCtaData = (ctaId) => {
  switch(ctaId) {
    case 1:
      //the home value pops an existing modal so just need the delay and enabled properties available
      return {       
        delay: 2,
        enabled: false
      };
    case 2:    //CTA GROUP 1
      return {
        ctaTitle: "Personalized Home Value Estimate",
        ctaSubTitle: "Discover Your Home's True Worth",
        ctaBody: "Interested in a personalized valuation of your home?",
        ctaTags: `RequestCustomValuation, OptInContact, Cta${ ctaId }Accept`,
        ctaDisplayTags: `Cta${ ctaId }Display`,
        ctaDisplayNote: "Prompt for a home valuation was displayed",
        ctaVerifiedNote: "Contact information was confirmed after requesting a home evaluation",
        ctaVerifyTags: "CtaContactVerfied",
        ctaImage: "https://imagedelivery.net/C4KZEiOQLExN0SnSaqUP4A/025d77d8-0d14-47d0-3ec9-71e68d9cd400/public",
        ctaNote: "I would like a custom home valuation",
        ctaNoteIncludeArea: false,
        ctaNoteIncludeAddress: true,
        ctaDisclaimer: ["By continuing, you consent to receive communications from us, including but not limited to updates, promotional offers, and other marketing materials. We value your privacy and will use your information solely for the purpose of contacting you as per your request or interest. You can opt out of these communications at any time by following the unsubscribe instructions provided in our emails or by contacting us directly. Your information will not be shared with third parties without your explicit consent."],
        ctaResponse: "Great! Your request has been submitted!",
        ctaSubmitButtonText: "Absolutely!", 
        ctaShowContactForm: true,
        ctaContactFormBody: "Please confirm or update your contact information to ensure you receive accurate updates.",
        ctaContactFormResponse: "Thanks for confirming, you're all set!",
        ctaVerifyButtonText: "Confirm",
        ctaContactMeMessage: "If you need further assistance, please don't hesitate to reach out.",
        delay: 1,
        scrollUpPercentage: 0,
        scrollDownPercentage: 0,
        enabled: true
      };
    case 3: //CTA GROUP 1
      return {
        ctaTitle: "Accurate Home Valuation",
        ctaSubTitle: "Uncover Your Property's Market Value",
        ctaBody: "Would you like to get an accurate valuation for your home?",
        ctaTags: `RequestCustomValuation, OptInContact, Cta${ ctaId }Accept`,
        ctaDisplayTags: `Cta${ ctaId }Display`,
        ctaDisplayNote: "Prompt for a home valuation was displayed",
        ctaVerifiedNote: "Contact information was confirmed after requesting a home evaluation",
        ctaVerifyTags: "CtaContactVerfied",
        ctaImage: "https://imagedelivery.net/C4KZEiOQLExN0SnSaqUP4A/1595044b-819f-45b5-892f-0a55704e3c00/public",
        ctaNote: "I would like a custom home valuation",
        ctaNoteIncludeArea: false,
        ctaNoteIncludeAddress: true,
        ctaDisclaimer: ["By continuing, you consent to receive communications from us, including but not limited to updates, promotional offers, and other marketing materials. We value your privacy and will use your information solely for the purpose of contacting you as per your request or interest. You can opt out of these communications at any time by following the unsubscribe instructions provided in our emails or by contacting us directly. Your information will not be shared with third parties without your explicit consent."],
        ctaResponse: "Awesome! We've received your request!",
        ctaSubmitButtonText: "Yes, please!", 
        ctaShowContactForm: true,
        ctaContactFormBody: "Ensure your contact details are correct so we can keep you informed.",
        ctaContactFormResponse: "Thanks for updating, you're all set!",
        ctaVerifyButtonText: "Verify",
        ctaContactMeMessage: "Need more information? Feel free to contact me anytime.",
        delay: 2,
        scrollUpPercentage: 0,
        scrollDownPercentage: 0,
        enabled: true
      };
    case 4:    //CTA GROUP 2
      return {
        ctaTitle: "Personalized Home Value Estimate",
        ctaSubTitle: "Discover Your Home's True Worth",
        ctaBody: "Interested in a personalized valuation of your home?",
        ctaTags: `RequestCustomValuation, OptInContact, Cta${ ctaId }Accept`,
        ctaDisplayTags: `Cta${ ctaId }Display`,
        ctaDisplayNote: "Prompt for a home valuation was displayed",
        ctaVerifiedNote: "Contact information was confirmed after requesting a home evaluation",
        ctaVerifyTags: "CtaContactVerfied",
        ctaImage: "https://imagedelivery.net/C4KZEiOQLExN0SnSaqUP4A/025d77d8-0d14-47d0-3ec9-71e68d9cd400/public",
        ctaNote: "I would like a custom home valuation",
        ctaNoteIncludeArea: false,
        ctaNoteIncludeAddress: true,
        ctaDisclaimer: ["By continuing, you consent to receive communications from us, including but not limited to updates, promotional offers, and other marketing materials. We value your privacy and will use your information solely for the purpose of contacting you as per your request or interest. You can opt out of these communications at any time by following the unsubscribe instructions provided in our emails or by contacting us directly. Your information will not be shared with third parties without your explicit consent."],
        ctaResponse: "Great! Your request has been submitted!",
        ctaSubmitButtonText: "Absolutely!", 
        ctaShowContactForm: true,
        ctaContactFormBody: "Please confirm or update your contact information to ensure you receive accurate updates.",
        ctaContactFormResponse: "Thanks for confirming, you're all set!",
        ctaVerifyButtonText: "Confirm",
        ctaContactMeMessage: "If you need further assistance, please don't hesitate to reach out.",
        delay: 1,
        scrollUpPercentage: 0,
        scrollDownPercentage: 0,
        enabled: true
      };
    case 5: //CTA GROUP 2
      return {
        ctaTitle: "Accurate Home Valuation",
        ctaSubTitle: "Uncover Your Property's Market Value",
        ctaBody: "Would you like to get an accurate valuation for your home?",
        ctaTags: `RequestCustomValuation, OptInContact, Cta${ ctaId }Accept`,
        ctaDisplayTags: `Cta${ ctaId }Display`,
        ctaDisplayNote: "Prompt for a home valuation was displayed",
        ctaVerifiedNote: "Contact information was confirmed after requesting a home evaluation",
        ctaVerifyTags: "CtaContactVerfied",
        ctaImage: "https://imagedelivery.net/C4KZEiOQLExN0SnSaqUP4A/1595044b-819f-45b5-892f-0a55704e3c00/public",
        ctaNote: "I would like a custom home valuation",
        ctaNoteIncludeArea: false,
        ctaNoteIncludeAddress: true,
        ctaDisclaimer: ["By continuing, you consent to receive communications from us, including but not limited to updates, promotional offers, and other marketing materials. We value your privacy and will use your information solely for the purpose of contacting you as per your request or interest. You can opt out of these communications at any time by following the unsubscribe instructions provided in our emails or by contacting us directly. Your information will not be shared with third parties without your explicit consent."],
        ctaResponse: "Awesome! We've received your request!",
        ctaSubmitButtonText: "Yes, please!", 
        ctaShowContactForm: true,
        ctaContactFormBody: "Ensure your contact details are correct so we can keep you informed.",
        ctaContactFormResponse: "Thanks for updating, you're all set!",
        ctaVerifyButtonText: "Verify",
        ctaContactMeMessage: "Need more information? Feel free to contact me anytime.",
        delay: 2,
        scrollUpPercentage: 0,
        scrollDownPercentage: 0,
        enabled: true
      };
    default:
      return {     
        //if it is not a mapped cta then just mark disabled and nothing will pop   
        enabled: false
      };
  }
};

export const formatFormNote = (data) => {

  if(!data.noteFormatter) {
    data.note = data.note || 'Form Submission';
    return;
  }
  
  //since we are formatting it here we can remove the meta data so you will see a few "delete data.meta[xx]", that will prevent duplicate info in notes.
  
  const formatterType = data.noteFormatter.toLowerCase();    

  switch(formatterType) {
    case "RequestShowing".toLowerCase():
      let formatted = `Showing request for ${data.formListingAddress}`;

      const option1 = data["meta[availableDate]"];
      const option2 = data["meta[alternativeDate]"];
      if(option1 || option2) {
        const dates = [];
        
        if (option1) 
          dates.push(option1);      

        if (option2)
          dates.push(option2);

        formatted += ` availability: ${dates.join(", ")}`;         

        delete data["meta[availableDate]"];
        delete data["meta[alternativeDate]"];
      } 

      if(!data.note) {
        data.note = formatted;
      } else {
        data.note = `${formatted}.  Message: ${data.note}`;
      }
      
    break;

    case "RequestMoreInfoMoving".toLowerCase():
      const movingDate = data["meta[movingDate]"] || 'not moving';
      const contactPreference = data["meta[reachMe]"];      
      const movingFormatted = `More information requested for ${data.formListingAddress} \nMoving Date: ${ movingDate } \nBest way to reach: ${ contactPreference } \nMessage: ${ data.note || 'please follow up'} `;

      data.note = movingFormatted;        
      
      delete data["meta[movingDate]"];
      delete data["meta[reachMe]"];
    break;

    case "RequestCustomValuation".toLowerCase():
      data.note = `Custom valuation request for ${data.notePropertyAddress}.\n\nAdditional property details: ${ data.note || 'none provided'} `;
    break;
    
    default:
    break;
  }
};

//TODO: check w/ John on location of this class
export class InsensitiveURLSearchParams {
  constructor(queryString) {
    this.params = new URLSearchParams(queryString);
    this.map = new Map();

    // Populate the map with lowercase keys
    for (const [key, value] of this.params.entries()) {
      this.map.set(key.toLowerCase(), value);
    }
  }

  get(key) {
    return this.map.get(key.toLowerCase());
  }
  
  //returns an object where all property names are lowercase (values remain untouched)
  getObjectLower() {
    return Object.fromEntries(this.map);
  }
}

