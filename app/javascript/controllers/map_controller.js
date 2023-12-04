import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#showUserLocation()
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
    console.log(userLocation)
      if (userLocation) {
        bounds.extend([userLocation.lng, userLocation.lat]);
      } else {
        console.log("marker-location")
        this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      }
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

  #showUserLocation() {
    if (navigator.geolocation) {
      // Get the user's current position
      navigator.geolocation.getCurrentPosition(
        position => {
          const { latitude, longitude } = position.coords;
          const userLocation = {lat: latitude, lng: longitude }

          const userMarker = document.createElement("div");
          userMarker.className = "user-marker";

          const popup = new mapboxgl.Popup().setHTML("You are here!");

          // Add the marker to the map
          new mapboxgl.Marker(userMarker)
          .setLngLat([longitude, latitude])
          .setPopup(popup)
          .addTo(this.map);

          this.#fitMapToMarkers(userLocation);
        },
        error => {
          console.error("Error getting user location:", error);
          // Fit the map bounds without the user's location if an error occurs
          this.#fitMapToMarkers(userLocation);
        }
      );
    } else {
      console.error("Geolocation is not supported by your browser");
      // Fit the map bounds without the user's location if geolocation is not supported
      this.#fitMapToMarkers(userLocation);
    }
  }
}
