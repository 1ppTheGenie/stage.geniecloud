import { createSignal, createEffect, For, Show } from "solid-js";

/*
const DropDownHeader = styled("div")`
	margin-bottom: 0.8em;
	padding: 0.4em 2em 0.4em 1em;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
	font-weight: 500;
	font-size: 1.3rem;
	color: #3faffa;
	background: #ffffff;
`;

const DropDownList = styled("ul")`
	padding: 0;
	margin: 0;
	padding-left: 1em;
	background: #ffffff;
	border: 2px solid #e5e5e5;
	box-sizing: border-box;
	color: #3faffa;
	font-size: 1.3rem;
	font-weight: 500;
	&:first-child {
		padding-top: 0.8em;
	}
`;

const ListItem = styled("li")`
	list-style: none;
	margin-bottom: 0.8em;
`;

*/

export const Dropdown = props => {
	const [isOpen, setIsOpen] = createSignal(false);
	const [selected, setSelected] = createSignal(props.selected);

	const toggleOpen = () => setIsOpen(state => !state);

	return (
		<div class="dropdown-container">
			<span onClick={toggleOpen}>{selected()}</span>
			<Show when={isOpen}>
				<input type="text" onInput={e => setSearch(e.target.value)} />
				<ul>
					<For each={props.options}>
						{option => (
							<li
								onClick={() => {
									setSelected(option);
									setIsOpen(false);
								}}>
								{option}
							</li>
						)}
					</For>
				</ul>
			</Show>
		</div>
	);
};
