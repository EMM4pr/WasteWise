import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = ["modal", "button"];

  connect() {
    setTimeout(() => {
      this.show();
    }, 5000);
  }

  show() {
    this.element.classList.add("show")
    this.element.style.display = "block"
  }

  close() {
    this.element.classList.remove("show")
  }

  save(element){
    this.element.save()
  }
}
