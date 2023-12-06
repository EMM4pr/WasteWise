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
    this.element.classList.remove()
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
