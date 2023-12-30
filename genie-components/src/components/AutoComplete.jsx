import { onMount } from "solid-js";

export const AutoComplete = props => {
	let acInput;

	onMount(() => {
		window.gHub.autoComplete(acInput, props.placeChanged);
	});

	return (
		<div style={props.containerStyle}>
			<input ref={acInput} type="text" style={props.inputStyle} />

			{props.children}
		</div>
	);
};
