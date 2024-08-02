import { createSignal } from "solid-js";
import { areaDataStore } from "@/utilities";
import { ClosePopup } from "@/components";

import "@/assets/css/lead-cta-tag.css";

export default (ctaData) => {     
	const [hasSubmitted, setHasSubmitted] = createSignal(false);	 	  
  const data = ctaData.ctaData;    
  const ctaNoteWithArea = `${data.ctaNote} ${areaDataStore.areaName ?? "area"}`;  

  //TODO: maybe put actual contact information in the contact section vs generic message.
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
              <div class="invert cta-response">
                <h4>{ data.ctaResponse }</h4>
              </div>                            
              <div class="cta-contact">                
                <h4>If you need any additonal information please reach out.</h4>                   
              </div>
            </Show>
            <Show when={hasSubmitted() === false}>	            
              <div class="invert cta-subtitle">
                <h1>{ data.ctaSubTitle }</h1>                
              </div>
              <div class="cta-body"> <h4>{ data.ctaBody }</h4>              
                <button                  
                    onClick={() => {
                      //this add lead handles the check for update/create                      
                      window.gHub.addLead(ctaNoteWithArea, { genieTags: data.ctaTags });                      
                      setHasSubmitted(true);
                    }}>
                    { data.ctaSubmitText }
                  </button> 
              </div>
            </Show>
          </div>
        </div>         			
      </div>  		
		</>
	);
};  
