import { Controller } from "stimulus"
import { initSortable } from "../components/init_sortable";


export default class extends Controller {
  static targets = [ "map", "marker" ]

  connect() {
    this.getRoute()
    initSortable(this.getRoute);
  }

  getRoute() {
    const markers = document.querySelectorAll(".roadmarker")
    // const markers = JSON.parse(this.mapTarget.dataset.markers);
    const roadMArkers = []
    markers.forEach((marker) => {
      console.log(marker.dataset.coordinates);
      roadMArkers.push(JSON.parse(marker.dataset.coordinates))
    })
    // console.log(roadMArkers);
    const map = new google.maps.Map(document.getElementById('road-map'), {
      zoom:15,
      center: {lat: roadMArkers[0]['lat'], lng: roadMArkers[0]['lng'] },
    })

    const testMarkers = []
    roadMArkers.slice(0, -1).forEach((marker, index) => {
      const directionsService = new google.maps.DirectionsService
      const directionsDisplay = new google.maps.DirectionsRenderer({
          map: map,
          suppressMarkers: true
      })
      calculateAndDisplayRoute(directionsService, directionsDisplay, {lat : roadMArkers[index]['lat'], lng: roadMArkers[index]['lng']}, {lat : roadMArkers[index+1]['lat'], lng: roadMArkers[index+1]['lng']});
    })
    roadMArkers.forEach((marker, index) => {
      let mark = new google.maps.Marker({
            position: {lat : marker['lat'], lng: marker['lng']},
            icon: marker['icon'],
            info_windows: marker['info_windows'],
            map: map
      })
      testMarkers.push(mark)
    })

    function calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB) {
      directionsService.route({
        origin: pointA,
        destination: pointB,
        // steps: ,
        travelMode: google.maps.TravelMode.DRIVING
      }, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(response);
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });
    }

    if (roadMArkers.length === 0) {
      map.setZoom(2);
    } else if (roadMArkers.length === 1) {
      map.setCenter(roadMArkers[0].lat, roadMArkers[0].lng);
      map.setZoom(14);
    } else {

      console.log(testMarkers);
      // map.fitLatLngBounds(testMarkers);
    }
  }
}
