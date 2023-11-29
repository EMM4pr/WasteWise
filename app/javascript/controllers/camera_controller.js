import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["picture", "imageholder", "simpleform"]

  connect() {
    console.log(this.pictureTarget)
  }

  upload(e){
    console.log("I am working")
    this.pictureTarget.setAttribute("src", window.URL.createObjectURL(e.currentTarget.files[0]));
    const actualImage = e.currentTarget.files[0]

    const formData = new FormData(this.simpleformTarget)
    // const imageBlob = new Blob([actualImage], { type: "application/octet-stream" });
    // console.log("before berlin", formData)
    // formData["bird_caught[image]"] = imageBlob
    // console.log("after berlin", formData)

    formData.append("adams test", actualImage, "haha.png");
  }
}
