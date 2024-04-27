import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="star-bar"
export default class extends Controller {
  changeClass() {
    
    this.element.dataset.option = 'true'

    const currentStar = document.querySelector('[data-option="true"]')
    const activated   = getElement('star-activated', 'id')
    const hiddenValue = getElement('rating', 'id')
    const stars       = getElement('[data-controller="star-bar"]')
    
    activated
    ? Deactivated(activated,stars) 
    : Activated(currentStar, hiddenValue, stars)

    function Activated(currentStar, hiddenValue, stars) {
      currentStar.id =  'star-activated'
      currentStar.setAttribute('class', 'bi bi-star-fill')
      hiddenValue.setAttribute('value', currentStar.getAttribute('value'))
      changeClassAnotherStar(stars)
    }

    function Deactivated(activated,stars) {
      activated.dataset.option = 'false'
      activated.id = 'star-deactivated'
      activated.setAttribute('class', 'bi bi-star')
      stars.forEach(el => el.setAttribute('class', 'bi bi-star'))
    }

    function getElement(value, selector='') {
      return selector.toLowerCase() === 'id'
              ? document.getElementById(value)
              : document.querySelectorAll(value)
    }
    
    function changeClassAnotherStar(stars) {
      let activeValue = hiddenValue.getAttribute('value')

      stars.forEach(el => {
        if (el.getAttribute('value') <= activeValue) { 

          el.setAttribute('class', 'bi bi-star-fill')
        }
      });
    }
  }
}
