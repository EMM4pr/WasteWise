import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = [, "imageholder", "simpleform", "camera"]

  connect() {
    // console.log(this.pictureTarget)

  }

  activateCamera(){
    this.cameraTarget.click()
  }

  upload(e){
    const actualImage = e.currentTarget.files[0]
    const formData = new FormData(this.simpleformTarget)
    formData.set('waste_item[photo]', actualImage);
    fetch(this.simpleformTarget.action, { method: "POST", headers: {"Accept": "text/plain"}, body: formData })
      .then(response => response.text())
      .then(data => {
        location.href = data
      })
  }
}
