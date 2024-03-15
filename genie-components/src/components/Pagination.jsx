import { Show, createSignal, createEffect } from "solid-js";

import "@/assets/css/pagination.css";

export const Pagination = props => {
	const [buttons, setButtons] = createSignal();
	const [totalPages, setTotalPages] = createSignal(0);
	const { pageChange, maxButtons = 10, withPrevNext = true } = props;
	const pageSize = props.pageSize || 10;

	createEffect(() => setTotalPages(Math.ceil(props.totalItems / pageSize)));

	createEffect(() => {
		let startPage, endPage;
		let currentPage = props.currentPage;

		// ensure current page isn't out of range
		if (props.currentPage < 1) {
			currentPage = 1;
		} else if (props.currentPage > totalPages()) {
			currentPage = totalPages();
		}

		if (parseInt(totalPages()) <= maxButtons) {
			// total pages less than max so show all pages
			startPage = 1;
			endPage = totalPages();
		} else {
			// total pages more than max so calculate start and end pages
			const maxPagesBeforeCurrentPage = Math.floor(maxButtons / 2);
			const maxPagesAfterCurrentPage = Math.ceil(maxButtons / 2) - 1;

			if (props.currentPage <= maxPagesBeforeCurrentPage) {
				// current page near the start
				startPage = 1;
				endPage = maxButtons;
			} else if (currentPage + maxPagesAfterCurrentPage >= totalPages()) {
				// current page near the end
				startPage = totalPages() - maxButtons + 1;
				endPage = totalPages();
			} else {
				// current page somewhere in the middle
				startPage = currentPage - maxPagesBeforeCurrentPage;
				endPage = currentPage + maxPagesAfterCurrentPage;
			}
		}

		if (endPage && startPage) {
			const b = Array.from(Array(endPage + 1 - startPage).keys()).map(i => startPage + i);

			setButtons(b.length > 1 ? b : null);
		}
	});

	return (
		<ul class="pagination" {...props}>
			<Show when={props.totalItems > 0}>
				{props.currentPage > 1 && withPrevNext && (
					<li onClick={() => pageChange(props.currentPage - 1)}>&laquo; Prev</li>
				)}
				<For each={buttons()}>
					{p => (
						<li
							onClick={() => pageChange(p)} // +1 because pages are 1-based
							classList={{ active: p === props.currentPage }}>
							{p}
						</li>
					)}
				</For>
				{props.currentPage < totalPages() && withPrevNext && (
					<li onClick={() => pageChange(props.currentPage + 1)}>Next &raquo;</li>
				)}
			</Show>

			<li>XX {props.currentPage} XZZZ</li>
		</ul>
	);
};
