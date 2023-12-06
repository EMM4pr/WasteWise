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
      if (this.levelValue === "30.1") {
        Swal.fire({
          title: "Hooray! You just leveled up your eco-game!",
          text: "Behold the mighty Sustainability Star Trophy – your ultimate reward for tossing that waste like an eco-champion! 🌿✨",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "25.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up as a Waste Warrior and unlocked the prestigious Planet Protector Plaque! 🌍✨",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "20.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up on the Eco Hero leaderboard—your Waste Wizard Diploma is now officially unlocked! 🌍♻️",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "15.1") {
        Swal.fire({
          title: "Boom! ",
          text: "You just leveled up your eco game and scored the legendary Eco Warrior Medal. Nice job on tossing that waste! 🌿🏆",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "10.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up in eco-heroism and unlocked the Trash Titan Certificate! 🌍🏆",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "5.1") {
        Swal.fire({
          title: "High-five!",
          text: "You've just upgraded your eco-game and scored the Green Thumb Trophy! 🌿💚",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
      if (this.levelValue === "1.1") {
        Swal.fire({
          title: "Hooray! ",
          text: "You've just unlocked the prestigious Eco Hero Badge! 🌟",
          imageUrl: "/rewards-img/frame.png",
          imageWidth: 400,
          imageHeight: 200,
          imageAlt: "Custom image"
        });
      }
    }

  }
}
