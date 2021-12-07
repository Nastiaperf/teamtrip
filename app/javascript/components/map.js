import GMaps from 'gmaps/gmaps.js';

const mapImport = () => {

  const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0,
      mapTypeControl: false,
      streetViewControl: true,
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers)
    map.addMarkers(markers);

    // const iconBase =
    //   "https://developers.google.com/maps/documentation/javascript/examples/full/images/";
    // const icons = {
    //   hotel: {
    //     icon: iconBase + "parking_lot_maps.png",
    //   },
    //   restaurant: {
    //     icon: iconBase + "library_maps.png",
    //   },
    //   activity: {
    //     icon: iconBase + "info-i_maps.png",
    //   },
    // };

    // if  (category === hotel) {
    //   const features = [
    //     {
    //       position: new google.maps.LatLng,
    //       type: "hotel",
    //     },
    //   ];
    // } else if  (category === restaurant) {
    //   const features = [
    //     {
    //       position: new google.maps.LatLng,
    //       type: "restaurant",
    //     },
    //   ];
    // } else if (category === activity) {
    //   const features = [
    //     {
    //       position: new google.maps.LatLng,
    //       type: "activity",
    //     },
    //   ];
    // }

    // markers.forEach(marker => {
    //   const marker = new google.maps.Marker({
    //     position: features[i].position,
    //     icon: icons[features[i].type].icon,
    //     map: map,
    //   });
    // })

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

export { mapImport }


// new google.maps.InfoWindow({
//   content: contentString,
// });
// https://developers.google.com/maps/documentation/javascript/infowindows#maps_infowindow_simple-javascript
