document.addEventListener(`DOMContentLoaded`, () => {
    const getHeaderValues = async url => {
        try {
            const response = await fetch(url, { method: 'HEAD', cache: 'no-cache' });
            
            // Check for successful response or redirect
            return response.ok || (response.status >= 300 && response.status < 400);
        } catch (error) {
            console.error(`Error checking resource: ${url}`, error);
            return false;
        }
    };

    const getRenderUpdate = async () => {
        const renderKeyAttrib = "data-renderkey";

        await Promise.all(
            Array.from(document.querySelectorAll(`[${renderKeyAttrib}]`)).map(
                async el => {
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

                        if (linkUrl.endsWith("png") || linkUrl.endsWith("webp") || linkUrl.endsWith("html")) {
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
                            if(pageCount > 1) div.classList.add("overlap");

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
                        a.setAttribute("target", "_blank");
                        a.classList.add("download");
                        a.classList.add("view");
                        a.href = linkUrl;
                        div.appendChild(a);

                        if (!linkUrl.endsWith("html")) {
                            a = document.createElement("a");
                            a.classList.add("download");
                            a.onclick = e => {
                                e.preventDefault();
                                downloadFile(linkUrl);
                            };
                            a.href = "#";
                            div.appendChild(a);
                        }

                        children.push(div);

                        if (children.length) {
                            el.innerHTML = "";

                            // In case it's just the title
                            if (children.length > 1) {
                                el.removeAttribute(renderKeyAttrib);
                            } else {
                                let s = document.createElement("span");
                                s.classList.add("rendering-spinner");
                                children.push(s);
                            }
                            children.forEach(c => el.appendChild(c));
                        }
                    } else {
                        // Resource not available, schedule a retry
                        setTimeout(() => getRenderUpdate(), 5000); // Retry after 5 seconds
                    }
                }
            )
        );

        if (document.querySelectorAll(`[${renderKeyAttrib}]`).length) {
            setTimeout(getRenderUpdate, 1000);
        }
    };
    getRenderUpdate();
});

const downloadFile = url => {
    fetch(url, { method: "get", mode: "no-cors", referrerPolicy: "no-referrer" })
        .then(res => res.blob())
        .then(res => {
            const aElement = document.createElement("a");
            const href = URL.createObjectURL(res);

            aElement.href = href;
            aElement.setAttribute("download", url.split("/").reverse()[0]);
            aElement.setAttribute("target", "_blank");
            aElement.click();

            URL.revokeObjectURL(href);
        });
};