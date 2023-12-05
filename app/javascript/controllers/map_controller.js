import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  async connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    await this.#showUserLocation()

    // if (this.userLocation) {
    //   this.#updateUserAddress()
    // } else {
    //   console.log("error");
    //   return
    // }

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #updateUserAddress() {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.userLocation.lng},${this.userLocation.lat}.json?access_token=${this.apiKeyValue}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const addressArray = data.features[0].place_name.split(",")
        addressArray.shift()
        document.getElementById("userAddress").innerText = addressArray.join();
        const currentAddress = document.getElementById("userAddress").innerText
        document.cookie = `${currentAddress}`
        console.log(currentAddress);
      });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers(userLocation) {
    const bounds = new mapboxgl.LngLatBounds()
    if (userLocation) {
      bounds.extend([userLocation.lng, userLocation.lat]);
    }
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1000 })
  }

  async #showUserLocation() {
    return new Promise((resolve) => {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          position => {
            const { latitude, longitude } = position.coords;
            this.userLocation = {lat: latitude, lng: longitude }

            const userMarker = document.createElement("div");
            userMarker.className = "user-marker";

            const popup = new mapboxgl.Popup().setHTML("You are here!");

            // Add the marker to the map
            new mapboxgl.Marker(userMarker)
            .setLngLat([longitude, latitude])
            .setPopup(popup)
            .addTo(this.map);

            this.#fitMapToMarkers(this.userLocation);
            resolve();
          },
          error => {
            console.error("Error getting user location:", error);
            // Fit the map bounds without the user's location if an error occurs
            this.#fitMapToMarkers(userLocation);
            resolve();
          }
        );
      } else {
        console.error("Geolocation is not supported by your browser");
        // Fit the map bounds without the user's location if geolocation is not supported
        this.#fitMapToMarkers(userLocation);
        resolve();
      }
    })
  }
}
