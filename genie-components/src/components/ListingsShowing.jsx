export const ListingsShowing = props => (
	<>
		Showing
		<span style="font-weight: bold">{` ${Math.max(props.offset + 1,1)}-${
			Math.max(props.offset + 1,1) +
			Math.min(Math.min(props.pageSize, props.len), props.len - props.offset)
		} `}</span>
		of

		<span style="font-weight: bold">{` ${props.len} `}</span>
		{props.mode === "sold"
			? `sold listings in the last ${props.period} months`
			: `${props.mode} listings`}
		. DOM: Days On Market
	</>
);
