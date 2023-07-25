export const Editable = props => {
	return (
		<span
			title={props.title}
			style={props.style}
			contenteditable="true"
			onBlur={e => {
				const name = e.target.innerText === "" ? props.default : e.target.innerText;
				props.store(name);
			}}
			onKeydown={e => {
				if (e.key === "Enter") {
					e.preventDefault();
				}
				if (e.key === "Backspace" || e.key === "Delete" || e.key === "Paste") {
					const selection = window.getSelection();
					// Don't allow deleting nodes
					if (!selection.anchorNode.isSameNode(selection.focusNode)) e.preventDefault();
				}
			}}>
			{props.children}
		</span>
	);
};
