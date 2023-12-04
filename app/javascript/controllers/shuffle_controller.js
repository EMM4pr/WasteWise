import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {

  static targets = ["card", "grid"]

  connect() {
    this.shuffleCards();
  }

  shuffleCards() {
    console.log("shuffle")
    const cards = this.cardTargets

    for (let i = cards.length - 1; i > 0; i--) {
      let j = Math.floor(Math.random() * (i + 1));
      [cards[i], cards[j]] = [cards[j], cards[i]];
      cards[i].remove();
    }

    cards.forEach(card => this.gridTarget.appendChild(card));
  }
}

/* import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  shuffleCards() {
    const cards = this.element.children;
    const cardsArray = Array.from(cards);

    for (let i = cardsArray.length - 1; i > 0; i--) {
      let j = Math.floor(Math.random() * (i + 1));
      [cardsArray[i], cardsArray[j]] = [cardsArray[j], cardsArray[i]];
      cards[i].remove();
    }

    cardsArray.forEach(card => this.element.appendChild(card));
  }
} */
