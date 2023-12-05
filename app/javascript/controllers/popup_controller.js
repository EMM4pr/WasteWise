import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="popup"
export default class extends Controller {
  static values = {
    level: String
  }
  connect() {
    const queryString = window.location.search;
    console.log(queryString);
    // ?origin=recent
    console.log("connected popup controller")
    console.log(this.levelValue);

    if (queryString === "?origin=create") {
      if (this.levelValue === "25.1") {
        Swal.fire({
          title: "Sweet!",
          text: "Modal with a custom image.",
          imageUrl: "rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
    }
  }


}
