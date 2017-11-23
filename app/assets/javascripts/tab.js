document.addEventListener("click", (event) => {
  let normalTab = document.querySelector(".spidy-tab.non-active");
  let activeTab = document.querySelector(".spidy-tab.active");
  let fromText = document.querySelector(".offer-card-from-freelancer")
  let toText = document.querySelector(".offer-card-to-freelancer")

  if (event.target === normalTab || event.target.parentNode === normalTab) {
    normalTab.classList.toggle("non-active");
    normalTab.classList.toggle("active");
    activeTab.classList.toggle("active");
    activeTab.classList.toggle("non-active");
    fromText.classList.toggle("hidden");
    toText.classList.toggle("hidden");
  }
});

