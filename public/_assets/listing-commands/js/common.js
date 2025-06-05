document.addEventListener("DOMContentLoaded", () => {
	const MAX_RETRIES = 3;
	const INITIAL_RETRY_DELAY = 5000;
	const renderKeyAttrib = "data-renderkey";

	const getHeaderValues = async url => {
		try {
			const response = await fetch(url, { method: "HEAD", cache: "no-cache" });
			return response.ok || (response.status >= 300 && response.status < 400);
		} catch (error) {
			console.error(`Error checking resource: ${url}`, error);
			return false;
		}
	};

	const renderElement = async (el, retryCount = 0) => {
		let linkUrl = `/${el.dataset.renderkey}`;
		let imageUrl;

		switch (true) {
			case linkUrl.endsWith("html"):
				imageUrl = linkUrl.replace("index.html", "grab-1.webp");
				break;
			case linkUrl.endsWith("pdf"):
				imageUrl = linkUrl.replace(".pdf", "-grab-1.webp");
				break;
			default:
				imageUrl = linkUrl;
		}

		const pageCount = el.dataset.pagecount ?? 0;
		const resourceAvailable = await getHeaderValues(imageUrl);

		if (resourceAvailable) {
			const children = [];
			const h4 = document.createElement("h4");
			h4.innerHTML = el.dataset.title;
			children.push(h4);

			if (
				linkUrl.endsWith("png") ||
				linkUrl.endsWith("webp") ||
				linkUrl.endsWith("html")
			) {
				const a = document.createElement("a");
				a.setAttribute("target", "_blank");
				a.href = linkUrl;

				let child = new Image();
				child.title = "1st Thumbnail";
				child.src = imageUrl;
				a.appendChild(child);

				children.push(a);
			} else if (linkUrl.endsWith("pdf")) {
				const div = document.createElement("div");
				if (pageCount > 1) div.classList.add("overlap");

				const a = document.createElement("a");
				a.setAttribute("target", "_blank");
				a.href = linkUrl;
				let child = new Image();
				child.title = "1st Thumbnail";
				child.src = imageUrl;
				a.appendChild(child);

				if (pageCount > 1) {
					child = new Image();
					child.title = "2nd Thumbnail";
					child.src = imageUrl.replace("-grab-1", "-grab-2");
					a.appendChild(child);
				}
				div.appendChild(a);
				children.push(div);
			}

			const div = document.createElement("div");
			div.classList.add("asset-links");

			let a = document.createElement("a");
			a.classList.add("asset-icon");
			a.innerHTML = `
                <svg fill="#000000" width="20px" height="20px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                    <path id="Path_38" data-name="Path 38" d="M-12.121,10.879a2.976,2.976,0,0,0-.292.355l-4.73-2.364A2.985,2.985,0,0,0-17,8a2.985,2.985,0,0,0-.143-.87l4.73-2.364a2.976,2.976,0,0,0,.292.355A2.989,2.989,0,0,0-10,6a2.989,2.989,0,0,0,2.121-.878A2.982,2.982,0,0,0-7,3,2.982,2.982,0,0,0-7.879.879a3,3,0,0,0-4.242,0A2.978,2.978,0,0,0-13,3a2.985,2.985,0,0,0,.143.87l-4.73,2.364a2.975,2.975,0,0,0-.292-.355,3,3,0,0,0-4.242,0A2.978,2.978,0,0,0-23,8a2.978,2.978,0,0,0,.879,2.121A2.989,2.989,0,0,0-20,11a2.989,2.989,0,0,0,2.121-.878,2.976,2.976,0,0,0,.292-.355l4.73,2.364A2.985,2.985,0,0,0-13,13a2.978,2.978,0,0,0,.879,2.121A2.989,2.989,0,0,0-10,16a2.989,2.989,0,0,0,2.121-.878A2.982,2.982,0,0,0-7,13a2.982,2.982,0,0,0-.879-2.121A3,3,0,0,0-12.121,10.879ZM-12,3a1.986,1.986,0,0,1,.586-1.414A1.993,1.993,0,0,1-10,1a1.993,1.993,0,0,1,1.414.585A1.986,1.986,0,0,1-8,3a1.986,1.986,0,0,1-.586,1.414,2,2,0,0,1-2.828,0A1.986,1.986,0,0,1-12,3Zm-9.414,6.414A1.986,1.986,0,0,1-22,8a1.986,1.986,0,0,1,.586-1.414A1.993,1.993,0,0,1-20,6a1.993,1.993,0,0,1,1.414.585A1.986,1.986,0,0,1-18,8a1.986,1.986,0,0,1-.586,1.414A2,2,0,0,1-21.414,9.414Zm10,5A1.986,1.986,0,0,1-12,13a1.986,1.986,0,0,1,.586-1.414A1.993,1.993,0,0,1-10,11a1.993,1.993,0,0,1,1.414.585A1.986,1.986,0,0,1-8,13a1.986,1.986,0,0,1-.586,1.414A2,2,0,0,1-11.414,14.414Z" transform="translate(23 -0.001)" fill="#fff"></path>
                </svg>
                <span>Share</span>
            `;
			a.classList.add("share-icon");
			a.addEventListener("click", e => {
				e.preventDefault();

				if (typeof FB !== "undefined") {
					const dialog = document.createElement("dialog");

					dialog.classList.add("sharing-disabled");

					dialog.innerHTML = `
					<h2>Sharing is not available</h2>
					<p>Facebook sharing has not loaded, possibly because you have an ad-blocker running.</p>
					<p>Try disabling ad-blockers and try again.</p>
					<button id="close-dialog">Close</button>
					`;

					document.body.appendChild(dialog);
					dialog.showModal();
					dialog
						.querySelector("#close-dialog")
						.addEventListener("click", () => {
							dialog.close();
							dialog.remove();
						});
				} else {
					FB.ui(
						{
							method: "share",
							href: window.location.origin + linkUrl,
							display: "popup",
							title: "quote",
						},
						response => {}
					);
				}
			});
			div.appendChild(a);

			if (!linkUrl.endsWith("html")) {
				a = document.createElement("a");
				a.classList.add("asset-icon");
				a.setAttribute("target", "_blank");
				a.href = linkUrl; // Opens directly in a new tab
				a.onclick = e => {
					e.preventDefault();
					downloadFile(linkUrl);
				};
				// a.href = "#";
				a.innerHTML = `
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 298 298" style="enable-background:new 0 0 298 298;" xml:space="preserve">
                        <g>
                            <rect y="265.5" width="298" height="32" fill="#fff"></rect>
                            <polygon fill="#fff" points="148.598,246.566 200.187,163.5 165,163.5 165,0.5 133,0.5 133,163.5 98.478,163.5"></polygon>
                        </g>
                    </svg>
                    <span>Download</span>
                `;
				div.appendChild(a);
			}

			children.push(div);

			el.innerHTML = "";
			children.forEach(c => el.appendChild(c));
			el.removeAttribute(renderKeyAttrib);
		} else if (retryCount < MAX_RETRIES) {
			setTimeout(
				() => renderElement(el, retryCount + 1),
				INITIAL_RETRY_DELAY * Math.pow(2, retryCount)
			); //If initial retry set to 5000, retries at 5, 10, 20 seconds will occur
		} else {
			console.error(
				`Failed to load resource after ${MAX_RETRIES} attempts: ${imageUrl}`
			);
			el.innerHTML = `<p>Failed to load resource: ${el.dataset.title} Try waiting a bit and refreshing the page.</p>`;
			el.removeAttribute(renderKeyAttrib);
		}
	};

	const getRenderUpdate = () => {
		const elements = Array.from(
			document.querySelectorAll(`[${renderKeyAttrib}]`)
		);
		elements.forEach(el => renderElement(el));
	};

	getRenderUpdate();
});

const downloadFile = url => window.open(url, "_blank");

window.fbAsyncInit = () =>
	FB.init({
		appId: "1759805591055751",
		xfbml: true,
		version: "v23.0",
	});

(function (d, s, id) {
	const fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	const js = d.createElement(s);
	js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	js.onerror = () => {
		console.warn("Facebook SDK blocked or failed to load.");
	};
	fjs.parentNode.insertBefore(js, fjs);
})(document, "script", "facebook-jssdk");
