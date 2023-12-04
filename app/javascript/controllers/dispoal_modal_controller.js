// app/javascript/controllers/disposal_modal_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    // Delay the modal display after 5 seconds
    setTimeout(() => {
      this.modalTarget.classList.add("show");
    }, 5000);
  }

  handleItemDisposed() {

    console.log('Item disposed!'); // Replace with your logic
  }
}
