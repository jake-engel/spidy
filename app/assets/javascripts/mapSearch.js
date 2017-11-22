const button = document.getElementById("home-search-map-submit");
const form = document.getElementById("home-map-search");

form.addEventListener("submit", (event) => {
  event.preventDefault();

  const search = document.getElementById("home-search-bar").value;
  fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=${search}`)
    .then(response => response.json())
    .then((data) => {
      const currentLat = data.results[0].geometry.location.lat;
      const currentLng = data.results[0].geometry.location.lng;
      const map = new google.maps.Map(document.getElementById("home-map"), {
        center: { lat: currentLat, lng: currentLng },
        zoom: 14
      });
      const marker = new google.maps.Marker({
        map: map,
        position: { lat: currentLat, lng: currentLng }
      });
    });
});

button.addEventListener("click", (event) => {
  event.preventDefault();
  const search = document.getElementById("home-search-bar").value;
  fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=${search}`)
    .then(response => response.json())

    .then((data) => {
      const currentLat = data.results[0].geometry.location.lat;
      const currentLng = data.results[0].geometry.location.lng;
      const map = new google.maps.Map(document.getElementById("home-map"), {
        center: { lat: currentLat, lng: currentLng },
        zoom: 14
      });
      const marker = new google.maps.Marker({
        map: map,
        position: { lat: currentLat, lng: currentLng }
      });
    });
});
