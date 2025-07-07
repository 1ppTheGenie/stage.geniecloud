import { createMemo } from "solid-js";

export const ListingsShowing = props => {
	const len = createMemo( () => props.data().length )
	const mode = createMemo( () => props.mode().toLowerCase() );
	const offset = createMemo( () => props.pageOffset() );

	return (
		<>
			Showing
			<span style="font-weight: bold">{` ${offset() + 1}${offset() + 1 == Math.min( offset() + props.pageSize(), len() ) ? '' : `-${Math.min( offset() + props.pageSize(), len() )}`} `}</span>
			of
			<span style="font-weight: bold">{` ${len()} `}</span>
			{mode() === "sold"
				? `sold listings in the last ${props.period} months`
				: `${mode()} listings`}
			. DOM: Days On Market
		</>
	);
}