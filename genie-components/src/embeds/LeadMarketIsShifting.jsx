import { useSettings, Context4Settings } from "@/utilities";

export default () => {
	const settings = useSettings(Context4Settings);
	const [isOpen, setIsOpen] = useState(false);
	const [hasOpened, setHasOpened] = useState(false);
	const [hasSent, setHasSent] = useState(false);
	const [emailAddress, setEmailAddress] = useState("");

	useEffect(() => {
		if (!isOpen) {
			let timer1 = setTimeout(() => {
				setIsOpen(true);
			}, settings.popuptimeout ?? 15000);

			return () => {
				clearTimeout(timer1);
			};
		}
	}, [isOpen, setIsOpen, settings.popuptimeout]);

	useEffect(() => {
		if (isOpen && !hasOpened) {
			setHasOpened(true);
		}
	}, [isOpen, hasOpened, setHasOpened]);

	if (!isOpen) {
		return null;
	}

	return (
		<div id="shadow-layer">
			<div id="market-is-shifting">
				<div>
					{hasSent && (
						<>
							<p>All set! Your report will be in your inbox shortly.</p>
							<button
								class="upper rounded"
								onClick={() => {
									setIsOpen(false);
								}}>
								Close
							</button>
						</>
					)}

					{!hasSent && (
						<>
							<div style="text-align: center">
								<h1 class="upper center">
									{settings.mstitle || `The market is shifting`}
								</h1>
								<h2 class="center">
									See the latest <span class="upper">trends</span>
								</h2>
								<h3 class="upper center" style="margin-bottom: 3rem">
									{settings.mscta || `Get your market insider report`}
								</h3>
								<input
									type="email"
									class="rounded"
									placeholder="Your email address"
									onChange={e => setEmailAddress(e.target.value)}
									style="margin-right: 1rem"
								/>
								<button
									class="upper rounded"
									onClick={() => {
										window.gHub.addLead("Market Shifting", {
											email: emailAddress,
											funnel_id: settings.collection_id,
										});
										setHasSent(true);
									}}>
									Send
								</button>
							</div>
							<img
								src="/_assets/_img/genie-market-report-book.png"
								alt="Laptop"
							/>

							<div class="close" onClick={e => setIsOpen(false)}>
								X
							</div>
						</>
					)}
				</div>
			</div>
		</div>
	);
};
