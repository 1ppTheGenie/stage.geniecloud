document.addEventListener('DOMContentLoaded', () => {
    const MAX_RETRIES = 3;
    const INITIAL_RETRY_DELAY = 5000;
    const renderKeyAttrib = "data-renderkey";

    const getHeaderValues = async url => {
        try {
            const response = await fetch(url, { method: 'HEAD', cache: 'no-cache' });
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

            el.innerHTML = "";
            children.forEach(c => el.appendChild(c));
            el.removeAttribute(renderKeyAttrib);
        } else if (retryCount < MAX_RETRIES) {
            setTimeout(() => renderElement(el, retryCount + 1), INITIAL_RETRY_DELAY * Math.pow(2, retryCount)); //If initial retry set to 5000, retries at 5, 10, 20 seconds will occur
        } else {
            console.error(`Failed to load resource after ${MAX_RETRIES} attempts: ${imageUrl}`);
            el.innerHTML = `<p>Failed to load resource: ${el.dataset.title} Try waiting a bit and refreshing the page.</p>`;
            el.removeAttribute(renderKeyAttrib);
        }
    };

    const getRenderUpdate = () => {
        const elements = Array.from(document.querySelectorAll(`[${renderKeyAttrib}]`));
        elements.forEach(el => renderElement(el));
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