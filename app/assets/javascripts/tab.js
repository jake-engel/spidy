document.addEventListener("click", function (event) {
  var normalTab = document.querySelector(".spidy-tab.non-active");
  var activeTab = document.querySelector(".spidy-tab.active");
  var fromText = document.querySelector(".from-freelancer");
  var toText = document.querySelector(".to-freelancer");

  if (event.target === normalTab || event.target.parentNode === normalTab) {
    normalTab.classList.toggle("non-active");
    normalTab.classList.toggle("active");
    activeTab.classList.toggle("active");
    activeTab.classList.toggle("non-active");
    fromText.classList.toggle("hidden");
    toText.classList.toggle("hidden");
  }
});
