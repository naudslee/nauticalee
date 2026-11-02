// Nautica Lee Consulting: small enhancements, no dependencies

(function () {
  // Theme preview: append ?theme=navy or ?theme=blush to any page URL to
  // preview an alternate palette. Default (no param) is sage.
  var params = new URLSearchParams(window.location.search);
  var theme = params.get("theme");
  if (theme === "navy" || theme === "blush") {
    document.documentElement.setAttribute("data-theme", theme);
    // Keep the preview while navigating between pages.
    document.querySelectorAll('a[href]').forEach(function (a) {
      var href = a.getAttribute("href");
      if (!href || /^(https?:|mailto:|tel:|#)/.test(href)) return;
      var url = new URL(href, window.location.href);
      url.searchParams.set("theme", theme);
      a.setAttribute("href", url.pathname + url.search + url.hash);
    });
  }

  // Sticky header shadow
  var header = document.querySelector(".site-header");
  function onScroll() {
    if (!header) return;
    header.classList.toggle("scrolled", window.scrollY > 8);
  }
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });

  // Mobile nav
  var toggle = document.querySelector(".nav-toggle");
  var links = document.querySelector(".nav-links");
  if (toggle && links) {
    toggle.addEventListener("click", function () {
      var open = links.classList.toggle("open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
    });
    links.querySelectorAll("a").forEach(function (a) {
      a.addEventListener("click", function () {
        links.classList.remove("open");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  // Reveal on scroll
  var reveals = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) { e.target.classList.add("in"); io.unobserve(e.target); }
      });
    }, { rootMargin: "0px 0px -8% 0px", threshold: 0.08 });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add("in"); });
  }

  // Footer year
  var y = document.getElementById("year");
  if (y) y.textContent = new Date().getFullYear();
})();
