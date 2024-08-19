import { createSignal, Show } from "solid-js";
import { areaDataStore } from "@/utilities";
import { ClosePopup, LeadCaptureForm } from "@/components";

import "@/assets/css/lead-cta-tag.css";

export default (ctaData) => {     
	const [hasSubmitted, setHasSubmitted] = createSignal(false);	   
  const [leadCaptured, setLeadCaptured] = createSignal(false);

  const data = ctaData.ctaData;  
  
  let formattedNote = data.ctaNote;

  if(data.ctaNoteIncludeArea && areaDataStore.areaName) 
    formattedNote = `Area Name: ${areaDataStore.areaName} \n${formattedNote}`; 
  
  if(window.gHub.leadAddress && data.ctaNoteIncludeAddress)
    formattedNote = `Property Address: ${window.gHub.leadAddress} \n${formattedNote}`
  
  //tagging that a lead was shown the CTA
  if(window.gHub.getLeadId())  
    window.gHub.addLead(data.ctaDisplayNote, { genieTags: data.ctaDisplayTags });
  
  return (
		<>
      <h2 class="lead-cta-title no-background">
        { data.ctaTitle }
      </h2>			        
      <div class="lead-cta">
        <ClosePopup />
        <div class=" center lead-cta-container">
          <div class="lead-cta-img-container">
            <img src={ data.ctaImage } alt="Call to Action" />
          </div>
          <div class="lead-cta-copy-container">              
            <Show when={hasSubmitted() === true}>
              <Show when={ !leadCaptured() }>
              <div class="invert cta-response">
                  <h4>{ data.ctaResponse }</h4>
                </div>
              </Show>
              <Show when={ leadCaptured() }>
              <div class="invert cta-response">
                  <h4>{ data.ctaContactFormResponse }</h4>
                </div>
              </Show>               
              <Show when={ data.ctaShowContactForm && !leadCaptured() }>
                <div class="contact-verify"> { data.ctaContactFormBody }</div>
                <LeadCaptureForm
                  formStyle="contactOnly"
                  setLeadCaptured={setLeadCaptured}
                  leadNote={ data.ctaVerifiedNote }
                  genieTags={ data.ctaVerifyTags }              
                  populateInputs={ true }
                  submitCaption = { data.ctaVerifyButtonText }
                />  
              </Show> 
              <Show when={ !data.ctaShowContactForm || leadCaptured() }>                                      
                <div class="cta-contact">                
                  <h4>{ data.ctaContactMeMessage }</h4>                   
                </div>
              </Show>
            </Show>
            <Show when={hasSubmitted() === false}>	            
              <div class="invert cta-subtitle">
                <h1>{ data.ctaSubTitle }</h1>                
              </div>
              <div class="cta-body"> <h4>{ data.ctaBody }</h4>              
                <button onClick={() => {
                    //this add lead handles the check for update/create                      
                    window.gHub.addLead(formattedNote, { genieTags: data.ctaTags });                      
                    setHasSubmitted(true);
                  }}>
                  { data.ctaSubmitButtonText }
                </button> 
              </div>
              <div class="cta-disclaimer">
                {data.ctaDisclaimer.map((copy, i) => {                            
                  return (<p>{copy}</p>) 
                })}
              </div>
            </Show>           
          </div>
        </div>         			
      </div>  		
		</>
	);
};  
