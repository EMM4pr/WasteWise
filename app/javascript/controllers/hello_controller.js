import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement", "lol"]

  connect() {
  }

  toggleElement() {
    event.preventDefault()
    this.togglableElementTarget.classList.toggle("d-none");
    const buttonText = this.lolTarget.innerText === "More Trash" ? "Hide Trash" : "More Trash";
    this.lolTarget.innerText = buttonText;
  }
}
