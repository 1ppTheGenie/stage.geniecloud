window.showAddressInput = () => {
	const checkBox = document.getElementById(`customCheck3`);

	document.getElementsByClassName(`property-address`)[0].style.display =
		checkBox.checked == true ? `block` : `none`;
};

document.addEventListener(`genie-lead-created`, lead =>
	gg.redirectToParentAsset({ lead_id: lead.detail.key })
);
