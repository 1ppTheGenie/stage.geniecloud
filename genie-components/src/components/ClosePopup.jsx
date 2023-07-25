export const ClosePopup = () => (
	<img
		class="popup-close"
		src="https://myneighborhood.re/genieapi/embed/template/home_value_request/images/false-icon.png"
		alt="Close Popup"
		onClick={() => {
			document.body.classList.remove("hasPopup");

			const el = document.querySelector(".popup-dialog.visible");
			if (el) {
				el.parentNode.removeChild(el);
			}
		}}
	/>
);
