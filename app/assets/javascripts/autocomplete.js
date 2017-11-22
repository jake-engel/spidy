const input = document.getElementById("search");
const output = document.getElementById("results");
input.addEventListener("keyup", (event) => {
  fetch(`https://trendyskills.com/service?q=keywords&like=${event.target.value}&key=BvhMs3g0Vv2iTtph`)
    .then(response => response.json())
    .then((data) => {
      const currentWords = data.keywords;
      output.querySelectorAll("li").forEach((li) => {
        li.remove();
      });
      currentWords.forEach((word) => {
        output.insertAdjacentHTML("beforeend", `<li><a href="#">${word.keyName}</a></li>`);
      });
    });
});
