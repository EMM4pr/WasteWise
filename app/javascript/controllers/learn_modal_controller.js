import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="learn-modal"
export default class extends Controller {
  static targets = [ "disposal" ]
  connect() {
    console.log(this.disposalTarget);
  }

  open() {
    this.disposalTarget.classList.add("show")
    this.disposalTarget.style.display = "block"
  }

  close() {
    this.disposalTarget.classList.remove("show")
  }
}
