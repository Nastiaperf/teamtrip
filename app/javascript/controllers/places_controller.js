import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['field']

  connect() {
    console.log(google)
    this.initMap()
    console.log(this.fieldTarget)
  }


  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
  }

}
