import {
	Match,
	Show,
	Switch,
	createEffect,
	createResource,
	createSignal,
} from "solid-js";

import { format } from 'timeago.js';
import { app, getRenderJson, getAgent, triggerReRender } from "@/utilities";

export const Render = props => {
	const [agentId, setAgentId] = createSignal();
	const [render] = createResource(
		props.renderId,
		async renderId => await getRenderJson(renderId)
	);
	const [agent] = createResource(
		agentId,
		async agentId => await getAgent(agentId)
	);

	createEffect(async () => {
		if (render()?.userId) {
			setAgentId(render()?.userId);
		}
	});
	console.log( 'props', { ...props } )
	return (
		<div class="render">
			<span class="render-id">{props.renderId}</span>

			<span>
				 {new Date( props.renderDate ).toLocaleString()} 
				</span>
				<span>
				{format( new Date( props.reRenderDate ) )}
				</span>
			<span>
				{agent()?.agent.firstName} {agent()?.agent.lastName}
			</span>
			<span classList={{ [render()?.theme]: true, [render()?.themeHue]: true }}>
				<span>{render()?.theme} {render()?.themeHue}</span>
				<span style="background-color: var(--theme-sub-heading-color)">
					&nbsp;
				</span>
				<span style="background-color: var(--theme-body-color)">&nbsp;</span>
				<span style="background-color: var(--theme-emphasis-color)">
					&nbsp;
				</span>
			</span>
			{console.log("@r", render())}
			{console.log("@e", app.store.errors)}

			<a target="_blank" href="">
				{render()?.collection ? 'Collection' : 'Asset'}
			</a>

			<span>{render()?.collection ?? render()?.asset}</span>
			<a href="" onClick={async e => { e.preventDefault(); await triggerReRender( props.renderId ); }}>
				Re-render
			</a>
		</div>
	);
};
