import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["picture", "imageholder", "simpleform"]

  connect() {
    // console.log(this.pictureTarget)
  }

  upload(e){
    this.pictureTarget.setAttribute("src", window.URL.createObjectURL(e.currentTarget.files[0]));

    const actualImage = e.currentTarget.files[0]
    const formData = new FormData(this.simpleformTarget)
    formData.set('waste_item[photo]', actualImage);
    console.log(formData);
    fetch(this.simpleformTarget.action, { method: "POST", headers: {"Accept": "text/plain"}, body: formData })
      .then(response => response.text())
      .then(data => {
        console.log(data);
        location.href = data
      })
  }
}
