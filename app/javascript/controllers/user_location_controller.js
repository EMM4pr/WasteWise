import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-location"
export default class extends Controller {

  static values = {
    apiKey: String
  }

  async connect() {
    await this.#showUserLocation()

    if (this.userLocation) {
      this.#updateUserAddress()
    } else {
      console.log("error");
      return
    }

  }

  async #showUserLocation() {
    return new Promise((resolve) => {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          position => {
            const { latitude, longitude } = position.coords;
            this.userLocation = {lat: latitude, lng: longitude }
            resolve();
          },
          error => {
            console.error("Error getting user location:", error);
            resolve();
          }
        );
      } else {
        console.error("Geolocation is not supported by your browser");
        resolve();
      }
    })
  }

  #updateUserAddress() {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.userLocation.lng},${this.userLocation.lat}.json?access_token=${this.apiKeyValue}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const addressArray = data.features[0].place_name.split(",")
        addressArray.shift()
        addressArray.pop()
        document.getElementById("userAddress").innerText = addressArray.join();
        const currentAddress = document.getElementById("userAddress").innerText
        // document.cookie = `${currentAddress}`
        // console.log(currentAddress);
      });
  }
}
