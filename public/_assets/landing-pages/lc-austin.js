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
document.querySelectorAll(".nav li a.nav-link").forEach(function (item) {
	item.addEventListener("click", function (e) {
		scrollTop(item.hash);
	});
});
var close_modal = document.getElementById("close_modal");
close_modal.addEventListener("click", function () {
	document.getElementById("fl-submit-message").style.display = "none";
});
var close_compare_modal = document.querySelector("#close-compare-modal");
document
	.querySelector("#fl-home-compare svg")
	.addEventListener("click", function () {
		document.querySelector("#fl-home-compare").style.display = "none";
	});
close_compare_modal.addEventListener("click", function () {
	document.querySelector("#fl-home-compare").style.display = "none";
});

document.querySelectorAll("#form_step1").forEach(function (item) {
	item.addEventListener("submit", function () {
		document.querySelector("#contact-me").style.display = "none";
	});
});

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
document.addEventListener(
	"DOMContentLoaded",
	function () {
		document
			.querySelector(".nav-hamburger")
			.addEventListener("click", function () {
				var menu = document.querySelector(".navigation-links");
				if (menu.style.display === "none" && menu.style.display === "") {
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
