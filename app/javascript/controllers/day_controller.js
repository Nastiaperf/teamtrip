import { Controller } from "stimulus"

export default class extends Controller {
  handleChange() {
    this.element.submit();
  }
}
