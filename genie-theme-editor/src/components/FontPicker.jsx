const fonts = {
	Arial: "../_css/arial.css",
	Barlow: "../_css/barlow.css",
	"Code-Pro": "../_css/code-pro.css",
	"Compass Sans": "../_css/compass-sans.css",
	"Compass Serif": "../_css/compass-serif.css",
	"Futura Condensed": "../_css/futura-condensed.css",
	Gotham: "../_css/gotham.css",
	"Helvetica Neue Condensed": "../_css/helvetica-neue-condensed.css",
	"Helvetica Neue": "../_css/helvetica-neue.css",
	Lato: "../_css/lato.css",
	Montserrat: "../_css/montserrat.css",
	"Myriad Pro Condensed": "../_css/myriad-pro-condensed.css",
	"Open Sans": "../_css/open-sans.css",
	Oscor: "../_css/oscor-font.css",
	Roboto: "../_css/roboto.css",
};

export const FontPicker = props => {
	return (
		<select onChange={e => props.setFont({ [e.target.value]: fonts[e.target.value] })}>
			<For each={Object.keys(fonts)}>{k => <option value={k}>{k}</option>}</For>
		</select>
	);
};
