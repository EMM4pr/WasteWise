import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="popup"
export default class extends Controller {
  static values = {
    level: String
  }
  static targets = ["audio"]

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
          imageUrl: "../../assets/rewards-img/stars.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "25.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up as a Waste Warrior and unlocked the prestigious Planet Protector Plaque! 🌍✨",
          imageUrl: "../../assets/rewards-img/frame.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "20.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up on the Eco Hero leaderboard—your Waste Wizard Diploma is now officially unlocked! 🌍♻️",
          imageUrl: "../../assets/rewards-img/wizard-diploma.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "15.1") {
        Swal.fire({
          title: "Boom! ",
          text: "You just leveled up your eco game and scored the legendary Eco Warrior Medal. Nice job on tossing that waste! 🌿🏆",
          imageUrl: "../../assets/rewards-img/medal.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "10.1") {
        Swal.fire({
          title: "Hooray!",
          text: "You've just leveled up in eco-heroism and unlocked the Trash Titan Certificate! 🌍🏆",
          imageUrl: "../../assets/rewards-img/certificate.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image",
          confirmButtonText: "Ok"

        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "5.1") {
        Swal.fire({
          title: "High-five!",
          text: "You've just upgraded your eco-game and scored the Green Thumb Trophy! 🌿💚",
          imageUrl: "https://res.cloudinary.com/dj6psz9ru/image/upload/v1701952014/trophy_qpaara.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }

      if (this.levelValue === "1.1") {
        Swal.fire({
          title: "Hooray! ",
          text: "You've just unlocked the prestigious Eco Hero Badge! 🌟",
          imageUrl: "../../assets/rewards-img/eco-badge.png",
          imageWidth: 120,
          imageHeight: 120,
          imageAlt: "Custom image"
        }).then((result) => {
          if (result.isConfirmed) {
            console.log("Is confirmed");
            this.playAudio()
          } else if (result.isDismissed) {
            console.log("Is not confirmed");
            this.playAudio()
          }
        })
      }
    }
  }

  fakeEnterKey() {
    console.log("faker key clicked")

    const buttonElement = document.getElementById('playAudio'); // Replace with your button's actual ID
    if (buttonElement) {
      console.log("CLICK");
      buttonElement.click();
    }

    const enterKeyEvent = new KeyboardEvent('keydown', { key: 'Enter' });
    // Replace 'yourTargetElement' with the actual target element that is listening for the 'Enter' key
    document.dispatchEvent(enterKeyEvent);
  }

  playAudio() {
    const button = document.querySelector("swal2-confirm")
    const audio = document.querySelector("audio")
    audio.play()
    /*const audioListener = (event) => {
      console.log(event)
      if (event.key === "Enter") {
        audio.play()
        document.removeEventListener("keydown", audioListener)
      }
    }

    document.addEventListener("keydown", audioListener); */
  }

}
