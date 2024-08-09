import { createSignal, Show } from "solid-js";
import { Spinner } from "@/components";

import "@/assets/css/lead-capture.css";

export const LeadCaptureForm = props => {
	const {
		setLeadCaptured,
		formStyle = "default",
		submitCaption = "Send Report",
		className = "",
		leadNote = "",
    genieTags = "OptInContact"
	} = props;

	const [showSpinner, setShowSpinner] = createSignal(false);

	const handleSubmit = async event => {
		event.preventDefault();

		setShowSpinner(true);

		let data = { ...props.existingData };
		const formData = new FormData(event.target);
		for (var key of formData.keys()) {
			data[key] = formData.get(key);
		}

    data.genieTags = genieTags;

		await window.gHub.addLead(leadNote, data);

		setShowSpinner(false);

		setLeadCaptured(true);
	};

	return (
		<form
			class={`lead-capture-form ${className}`}
			style="max-width:800px; margin: 1vw"
			onSubmit={e => handleSubmit(e)}>
			<Show when={formStyle === "valuation"}>
				<input type="text" name="firstName" placeholder="Enter your first name" />
				<input type="text" name="lastName" placeholder="Enter your last name" />
				<input type="text" name="phoneNumber" placeholder="Phone Number" />
				<input type="email" name="emailAddress" placeholder="Email Address" />
				<textarea
					placeholder="Is there anything we should know before estimation?"
					name="message"
				/>
			</Show>

			<Show when={formStyle === "default"}>
				<input type="text" name="firstName" placeholder="First Name" />
				<input type="text" name="lastName" placeholder="Last Name" />
				<input type="email" name="emailAddress" placeholder="Email Address" />
				<input type="text" name="phoneNumber" placeholder="Phone Number" />

				<div class="lead-capture-notify">
					<p>
						<em>* we keep your email private, no one else gets to see it</em>
					</p>					
				</div>
			</Show>

			<button type="submit">
				{submitCaption} {showSpinner() && <Spinner />}
			</button>
		</form>
	);
};
