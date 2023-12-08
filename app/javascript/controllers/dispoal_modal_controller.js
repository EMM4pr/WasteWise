import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = ["modal", "button", "disposal"];

  connect() {
    this.showLoading()
    setTimeout(() => {
      this.show();
    }, 25000);
  }

  show() {
    this.disposalTarget.classList.add("show")
    this.disposalTarget.style.display = "block"
  }

  showLoading() {
    this.modalTarget.classList.remove("hidden")
    setTimeout(() => {
      this.modalTarget.classList.add("d-none")
    }, 3000)
  }

  close() {
    this.disposalTarget.classList.remove("show")
  }

  save(event){
    /* var audio = new Audio('audio_file.mp3');
    audio.play(); */

    console.log("fetching")
    // event listener post reqeust
    // call create method on controller via fetch request as a post
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST", //  Stimulus value
      headers: { "Accept": "application/json" }, // type of info
      body: JSON.stringify({}) //what info
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })

    }
}
