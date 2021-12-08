import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["markers", "card"]

  connect() {
    console.log('coucou')
    console.log(this.cardTargets)
    const markers = document.querySelectorAll("div[role='button']")
    console.log(markers)
  }

  hover(event) {
    const markerId = event.srcElement.dataset.id
    const marker = document.querySelectorAll(`div[title='${markerId}']`)[0]
    console.log(marker)
    marker.classList.add("bg-primary")
  }

  leave(event) {
    const markerId = event.srcElement.dataset.id
    const marker = document.querySelectorAll(`div[title='${markerId}']`)[0]
    marker.classList.remove("bg-primary")
  }
}
