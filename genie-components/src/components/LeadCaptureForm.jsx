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
		genieTags = "OptInContact",
		populateInputs = false,
	} = props;

	const [showSpinner, setShowSpinner] = createSignal(false);
	const [showNameInputs, setShowNameInputs] = createSignal(true);

	let inputEmail = "";
	let intputPhone = "";
	//when we have a lead in context do not show the name inputs since we do not update that information, only used for create
	if (window.gHub.getLeadId()) {
		setShowNameInputs(false);
	}

	if (populateInputs) {
		if (window.gHub.leadEmailAddress) inputEmail = window.gHub.leadEmailAddress;

		if (window.gHub.leadPhoneNumber) intputPhone = window.gHub.leadPhoneNumber;
	}

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
				<Show when={showNameInputs()}>
					<input
						type="text"
						name="firstName"
						placeholder="Enter your first name"
					/>
					<input
						type="text"
						name="lastName"
						placeholder="Enter your last name"
					/>
				</Show>
				<input
					type="text"
					name="phoneNumber"
					placeholder="Phone Number"
					value={intputPhone}
				/>
				<input
					type="email"
					name="emailAddress"
					placeholder="Email Address"
					value={inputEmail}
				/>
				<textarea
					placeholder="Is there anything we should know before estimation?"
					name="message"
				/>
			</Show>

			<Show when={formStyle === "default"}>
				<Show when={showNameInputs()}>
					<input type="text" name="firstName" placeholder="First Name" />
					<input type="text" name="lastName" placeholder="Last Name" />
				</Show>
				<input
					type="email"
					name="emailAddress"
					placeholder="Email Address"
					value={inputEmail}
				/>
				<input
					type="text"
					name="phoneNumber"
					placeholder="Phone Number"
					value={intputPhone}
				/>

				<div class="lead-capture-notify">
					<p>
						<em>* we keep your email private, no one else gets to see it</em>
					</p>
				</div>
			</Show>

			<Show when={formStyle === "contactOnly"}>
				<input
					type="email"
					name="emailAddress"
					placeholder="Email Address"
					value={inputEmail}
				/>
				<input
					type="text"
					name="phoneNumber"
					placeholder="Phone Number"
					value={intputPhone}
				/>
			</Show>

			<button type="submit">
				{submitCaption} {showSpinner() && <Spinner />}
			</button>
		</form>
	);
};
