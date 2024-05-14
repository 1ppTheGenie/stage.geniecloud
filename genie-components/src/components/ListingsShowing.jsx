export const ListingsShowing = props => (
		<>
			Showing
			<span style="font-weight: bold">{` ${props.offset + 1}${ props.offset + 1 == Math.min( props.offset + props.pageSize, props.len) ? '':  `-${Math.min( props.offset + props.pageSize, props.len)}`} `}</span>
			of
			<span style="font-weight: bold">{` ${props.len} `}</span>
			{props.mode === "sold"
				? `sold listings in the last ${props.period} months`
				: `${props.mode} listings`}
			. DOM: Days On Market
		</>
	);
