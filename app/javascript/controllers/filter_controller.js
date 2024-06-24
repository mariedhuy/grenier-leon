import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = [ "items", "form", "query", "category" ]

  showResults(event) {
    event.preventDefault();
    
    const url = `${this.formTarget.action}?query=${this.queryTarget.value}`
    console.log(url)

    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.itemsTarget.outerHTML = data
      })
    }

    filterResults(event) {
      event.preventDefault();

      const category = event.target.value
      const url = `${this.formTarget.action}?filter=${category}`
      console.log(url)
      console.log(category)

      fetch(url, {headers: { "Accept": "text/plain" }})
        .then(response => response.text())
        .then((data) => {
          this.itemsTarget.outerHTML = data
        })
    }
}
