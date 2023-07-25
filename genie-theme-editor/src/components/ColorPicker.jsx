export const ColorPicker = props => {
	return (
		<input
			type="color"
			value={props.color}
			onInput={e => props.setColor(e.target.value)}></input>
	);
};
