$(document).ready(function() {
  var mapContainerId = 'map'
  var mapContainer = $('#' + mapContainerId)
  if( mapContainer.length ) {
    L.mapbox.accessToken = 'pk.eyJ1IjoiYmpvYmltIiwiYSI6ImNpaXoyMTNuaDAwNGJ0dWx3bXJ0Y2l5bHUifQ.hP6a-xW8ailzIX8VN3XscQ';
    var latitude = mapContainer.data('latitude')
    var longitude = mapContainer.data('longitude')
    var map = L.mapbox.map('map', 'mapbox.streets').setView([latitude, longitude], 15);
    L.marker([latitude, longitude]).addTo(map);
  }
});

