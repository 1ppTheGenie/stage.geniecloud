document.getElementById("filter").addEventListener("keyup", e => {
	let fnc;
	if (e.target.value.length >= 3) {
		const search = e.target.value.toLowerCase();
		fnc = d =>
			(d.style.display = d.textContent.toLowerCase().includes(search) ? "flex" : "none");
	} else {
		fnc = d => (d.style.display = "flex");
	}

	[...document.querySelectorAll(".genie-filter > div")].forEach(fnc);
});
