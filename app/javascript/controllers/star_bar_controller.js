import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="star-bar"
export default class extends Controller {
  changeclass() {
    let elClasses = []
    let elActivated = document.getElementById('star-activated')
    let elHiddenValue = document.getElementById('rating')
    let elValues = document.querySelectorAll('[data-controller="star-bar"]')

 
    this.element.dataset.option = 'true'
    this.element.setAttribute('id', 'star-activated')
    this.element.setAttribute('class', 'bi bi-star-fill')
    console.log(this.element.getAttribute('value'))
    elHiddenValue.setAttribute('value', this.element.getAttribute('value'))
    elValues.forEach((el) => {
      if (el.getAttribute('value') < document.getElementById('star-activated').getAttribute('value')) {
        elClasses.push(el)
      }
    })
    elClasses.forEach((el) => el.setAttribute('class', 'bi bi-star-fill'))

    if (elActivated) {
      elActivated.setAttribute('id', 'star-deactivated')
      elActivated.setAttribute('class', 'bi bi-star')
      elValues.forEach((el) => el.setAttribute('class', 'bi bi-star'))
    }
  }
}
