import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['field']

  connect() {
    this.initMap()
  }


  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
  }

}
