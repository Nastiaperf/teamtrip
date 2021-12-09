import GMaps from 'gmaps/gmaps.js';

const mapImport = () => {

  const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0,
      mapTypeControl: false,
      streetViewControl: true,
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    const gmapsMarkers = map.addMarkers(markers);


    gmapsMarkers.forEach(gmapsMarker => {
      const infowindow = new google.maps.InfoWindow({
        content: gmapsMarker.info_window,
      });
      gmapsMarker.set('title', gmapsMarker.id)

      const cards = document.querySelectorAll('.card-marker')
      cards.forEach((card) => {
        card.addEventListener('mouseenter', (event) => {
          // console.log('coucou')
          // console.log(typeof event.target.dataset.id)
          // console.log(.)
          const test = gmapsMarkers.find(gmapsMarker => gmapsMarker.id === parseInt(event.target.dataset.id, 10))
          // console.log(test)

          test.setAnimation(google.maps.Animation.BOUNCE)
          setTimeout(() => {
            test.setAnimation(null)
          }, 700);
        })
      })


      const directionsService = new google.maps.DirectionsService();
      const directionsRenderer = new google.maps.DirectionsRenderer();
      directionsRenderer.setMap(map);

        // console.log(gmapsMarker.id)
        // console.log(gmapsMarker)
        // gmapsMarker.dataset.marker = gmapsMarker.id
        // console.log(gmapsMarker)

      gmapsMarker.addListener("click", () => {
        infowindow.open({
          anchor: gmapsMarker,
          map,
          shouldFocus: false,
        });
        infoWindow.addListener('closeclick', () => {
          // Handle focus manually.
        });
      });
    });

    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }
  }
}


function calcRoute() {
  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  var request = {
    origin: start,
    destination: end,
    travelMode: 'DRIVING'
  };
  directionsService.route(request, function (result, status) {
    if (status == 'OK') {
      directionsRenderer.setDirections(result);
    }
  });
}


export { mapImport }
export { calcRoute }


// new google.maps.InfoWindow({
//   content: contentString,
// });
// https://developers.google.com/maps/documentation/javascript/infowindows#maps_infowindow_simple-javascript
