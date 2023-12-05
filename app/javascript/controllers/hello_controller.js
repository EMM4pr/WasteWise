import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement", "lol"]

  connect() {
  }

  toggleElement() {
    event.preventDefault()
    this.togglableElementTarget.classList.toggle("d-none");
    const buttonText = this.lolTarget.innerText === "Show All My Items" ? "Hide The Whole List" : "Show All My Items";
    this.lolTarget.innerText = buttonText;
  }
}
