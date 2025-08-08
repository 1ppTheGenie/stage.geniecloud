import { Portal } from "solid-js/web";
import { createSignal, onCleanup, onMount } from "solid-js";

import "@/assets/css/popup.css";
import "@/assets/css/data-access.css";
import "@/assets/css/lead-capture.css";

export const DataAccess = props => {
	const [fields, setFields] = createSignal({
		genieTags: "ClickCta,AccessData",
	});
	let dialogRef;

	const giveAccess = () => {
		window.gHub.addLead("Data Access", fields());
		typeof props.signedin == "function" && props.signedin(true);
		dialogRef.close();
	};

	onMount(() => {
		if (dialogRef && !dialogRef.open) {
			dialogRef.showModal();
		}
	});

	return (
		<Portal mount={document.body}>
			<dialog
				id="data-access-dialog"
				ref={dialogRef}
				class="data-access-dialog">
				<form
					method="dialog"
					class="lead-capture-form"
					onSubmit={e => {
						e.preventDefault();
						giveAccess();
					}}>
					<h1>Access Private Data Now</h1>

					<p>
						Some state laws require verification of your email address in order
						to access past sales. Not to worry though, you're only a minute away
						from seeing the sales data you are looking for and your email will
						be kept private, secure &amp; will never be sold or spammed!
					</p>

					<input
						type="text"
						value={fields().name || ""}
						onInput={e =>
							setFields(f => ({ ...f, name: e.currentTarget.value }))
						}
						placeholder="Your Name"
					/>
					<input
						type="email"
						value={fields().email || ""}
						onInput={e =>
							setFields(f => ({ ...f, email: e.currentTarget.value }))
						}
						placeholder="Your Email"
					/>
					<input
						type="text"
						value={fields().telephone || ""}
						onInput={e =>
							setFields(f => ({ ...f, telephone: e.currentTarget.value }))
						}
						placeholder="Your Phone No."
					/>

					<div class="actions">
						<button type="submit">Sign In</button>
						<button type="button" onClick={() => typeof props.signedin == "function" && props.signedin(false)}>
							Cancel
						</button>
					</div>

					{/*<a href="/privacy" style="color:var(--theme-body-color)">
						Privacy Policy
					</a>*/}
				</form>
			</dialog>
		</Portal>
	);
};
