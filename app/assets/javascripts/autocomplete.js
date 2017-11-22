var input = document.getElementById("search");
var output = document.getElementById("results");
input.addEventListener("keyup", function (event) {
  fetch("https://trendyskills.com/service?q=keywords&like=" + event.target.value + "&key=BvhMs3g0Vv2iTtph").then(function (response) {
    return response.json();
  }).then(function (data) {
    var currentWords = data.keywords;
    output.querySelectorAll("li").forEach(function (li) {
      li.remove();
    });
    currentWords.forEach(function (word) {
      output.insertAdjacentHTML("beforeend", "<li><a href=\"#\">" + word.keyName + "</a></li>");
    });
  });
});
