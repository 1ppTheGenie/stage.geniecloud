import { createSignal } from "solid-js";

import "@/assets/css/popup.css";
import "@/assets/css/data-access.css";
import "@/assets/css/lead-capture.css";

export const DataAccess = ({ signedin }) => {
	const [fields, setFields] = createSignal({ genieTags: "ClickCta,AccessData" });

	const giveAccess = () => {
		window.gg.addLead("Data Access", fields);
		signedin(true);
	};

	return (
		<div className="popup-dialog">
			<div id="data-access" className="lead-capture-form">
				<h1>Access Private Data Now</h1>

				<p>
					Some state laws require verification of your email address in order to access
					past sales. Not to worry though, you're only a minute away from seeing the sales
					data you are looking for and your email will be kept private, secure & will
					never be sold or spammed!
				</p>

				<input
					type="text"
					value={fields.name}
					onChange={e => setFields({ ...fields, name: e.target.value })}
					placeholder="Your Name"
				/>
				<input
					type="email"
					value={fields.email}
					onChange={e => setFields({ ...fields, email: e.target.value })}
					placeholder="Your Email"
				/>
				<input
					type="text"
					value={fields.telephone}
					onChange={e => setFields({ ...fields, telephone: e.target.value })}
					placeholder="Your Phone No."
				/>

				<button onClick={e => giveAccess()}>Sign In</button>

				<a href="as" style="color:var(--theme-body-color)">
					Privacy Policy
				</a>
			</div>
		</div>
	);
};
