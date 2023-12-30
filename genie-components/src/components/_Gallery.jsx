import { For, onMount, createSignal, createEffect } from "solid-js";

import "@/assets/css/gallery.css";
import Icon from "@/assets/icon-magnify.svg";

export default props => {
	const [currentPhoto, setCurrentPhoto] = createSignal(0);
	const [photos, setPhotoCount] = createSignal(0);

	onMount(() => {
		//window.gHub.lazyLoader("#property-gallery img.lazy");
		setPhotoCount(document.querySelectorAll(".property-images").length);
	});

	createEffect(() => {
		const left =
			document.querySelectorAll(".property-images")[currentPhoto()].offsetLeft;

		document.getElementById("property-gallery").style.left = `-${left}px`;
	});

	const moveGallery = direction => {
		setCurrentPhoto(current =>
			Math.min(Math.max(current + direction, 0), photos() - 1)
		);
	};

	return (
		<>
			<For each={props.images}>
				{(img, index) => (
					<div class="property-images">
						<div class="property-image">
							<div class="property-single-image">
								<div class="close">
									<svg
										width="24px"
										height="24px"
										viewBox="0 0 24 24"
										fill="#fff"
										xmlns="http://www.w3.org/2000/svg">
										<g data-name="Layer 2">
											<g data-name="close">
												<rect
													width="24"
													height="24"
													transform="rotate(180 12 12)"
													opacity="0"
												/>
												<path d="M13.41 12l4.3-4.29a1 1 0 1 0-1.42-1.42L12 10.59l-4.29-4.3a1 1 0 0 0-1.42 1.42l4.3 4.29-4.3 4.29a1 1 0 0 0 0 1.42 1 1 0 0 0 1.42 0l4.29-4.3 4.29 4.3a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42z" />
											</g>
										</g>
									</svg>
								</div>
								<img
									src={img}
									loading="lazy"
									alt="Featured image from the property"
								/>
								<div
									class="image-overlay-content"
									onClick={() => {
										document.body.classList.toggle("lightbox");
										setCurrentPhoto(index);
									}}>
									<div class="zoom-image"></div>
								</div>
							</div>
						</div>
					</div>
				)}
			</For>

			<button onClick={() => moveGallery(-1)}></button>
			<button onClick={() => moveGallery(1)}></button>
		</>
	);
};
