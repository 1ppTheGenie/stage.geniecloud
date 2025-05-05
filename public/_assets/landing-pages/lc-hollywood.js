// Menu scroll js
var offsetHeight = 100;
if (window.innerWidth <= 768) {
	offsetHeight = 250;
}
function scrollTop(element) {
	setTimeout(function () {
		window.scroll({
			behavior: "smooth",
			left: 0,
			top: document.querySelector(element).offsetTop - offsetHeight,
		});
	}, 10);
}
document.querySelectorAll(".nav li a.nav-link").forEach(item => {
	item.addEventListener("click", function (e) {
		scrollTop(item.hash);
	});
});
// End Menu scroll js

// Get the modal
var modal = document.getElementById("schedule-modal");
var modal2 = document.getElementById("request-modal");

// Get the button that opens the modal
var btn = document.getElementById("schedule-modal-btn");
var btn2 = document.getElementById("request-modal-btn");

// Get The Button to close  modal
var closeBtn = document.getElementById("schedule-modal-close");
var closeBtn2 = document.getElementById("request-modal-close");

btn.onclick = function () {
	document.getElementById("backdrop").style.display = "block";
	modal.style.display = "block";
	modal.classList.add("in");
};
btn2.onclick = function () {
	document.getElementById("backdrop").style.display = "block";
	modal2.style.display = "block";
	modal2.classList.add("in");
};

closeBtn.onclick = function () {
	document.getElementById("backdrop").style.display = "none";
	modal.style.display = "none";
	modal.classList.remove("in");
};
closeBtn2.onclick = function () {
	document.getElementById("backdrop").style.display = "none";
	modal2.style.display = "none";
	modal2.classList.remove("in");
};

var scrollPosition = window.scrollY;
var logoContainer = document.getElementsByClassName("header")[0];

window.addEventListener("scroll", function () {
	scrollPosition = window.scrollY;
	if (scrollPosition >= 150) {
		logoContainer.classList.add("fixed");
	} else {
		logoContainer.classList.remove("fixed");
	}
});

function scrollToEmbed() {
	scrollTop("#real_time_market_trends");
}

document.addEventListener(
	"DOMContentLoaded",
	() => {
		document
			.querySelector(".nav-hamburger")
			.addEventListener("click", function () {
				var menu = document.querySelector(".navigation-links");
				if (menu.style.display === "none" || menu.style.display === "") {
					menu.style.display = "block";
				} else {
					menu.style.display = "none";
				}
			});

		if (window.innerWidth <= 768) {
			document
				.querySelector(".nav-item")
				.addEventListener("click", function () {
					document.querySelector(".navigation-links").style.display = "none";
				});
		}
	},
	false
);

document.querySelectorAll(".contact-me-btn").forEach(item => {
	item.addEventListener("click", function () {
		document.querySelector("#contact-me").style.display = "block";
		document.querySelector("#contact-me").classList.add("in");
	});
});

document
	.querySelector("#contact-me svg")
	.addEventListener("click", function () {
		document.querySelector("#contact-me").style.display = "none";
		document.querySelector("#contact-me").classList.remove("in");
	});

document.addEventListener("DOMContentLoaded", function() {
		const maxLength = 120;
	
		document.querySelectorAll('.summary').forEach(function(summary) {
			const fullTextSpan = summary.querySelector('.full-text');
			const fullText = fullTextSpan.innerHTML.trim();
			const toggleLink = summary.querySelector('.toggle-link');
			const dots = summary.querySelector('.dots');
			const moreTextSpan = summary.querySelector('.more-text');
	
			if (fullText.length > maxLength) {
				const shortText = fullText.substring(0, maxLength);
				const remainingText = fullText.substring(maxLength);
	
				fullTextSpan.innerHTML = shortText;
				moreTextSpan.innerHTML = remainingText;
				dots.style.display = 'inline';
				toggleLink.style.display = 'inline';
	
				toggleLink.addEventListener('click', function() {
					if (toggleLink.textContent === " Read More") {
						moreTextSpan.style.display = 'inline';
						dots.style.display = 'none';
						toggleLink.textContent = ' Read Less';
					} else {
						moreTextSpan.style.display = 'none';
						dots.style.display = 'inline';
						toggleLink.textContent = ' Read More';
					}
				});
			}
		});
	});
	
