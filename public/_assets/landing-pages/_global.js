(async () => {
	try {
		const response = await fetch(`${window.ghUrl}/version.txt`);
		if (!response.ok) {
			throw new Error("Failed to load Genie Version");
		}

		const version = await response.text();
		window.ghUrl += `/landing-pages/dist/${version}`;

		const script = document.createElement("script");
		script.type = "module";
		script.crossOrigin = "crossorigin";
		script.src = `${window.ghUrl}/assets/index.js`;
		document.head.appendChild( script );
		
		const link = document.createElement('link');
		link.rel = 'stylesheet';
		link.href = `${window.ghUrl}/assets/index.css`;;
		document.head.appendChild(link);
	} catch (error) {
		console.error("Error loading script:", error);
	}
})();
