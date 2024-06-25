import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = [ "form", "items", "category", "location", "item" ]

  showResults(event) {
    event.preventDefault();
    const location = this.locationTarget.value
    const url = `${this.formTarget.action}?item=${this.itemTarget.value}&location=${location}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.itemsTarget.outerHTML = data
      })
    }

  filterResults(event) {
    event.preventDefault();
// Target sur input de location (dans html form)
// Recup dans variable la valeur (ville)
// Ajouter cette valeur dans l'url (si elle existe), on l'interpole dans url
    const location = this.locationTarget.value
    const category = event.target.value
    const url = `${this.formTarget.action}?filter=${category}&location=${location}`
    fetch(url, {headers: { "Accept": "text/plain" }})
      .then(response => response.text())
      .then((data) => {
        this.itemsTarget.outerHTML = data
      })
  }
}
