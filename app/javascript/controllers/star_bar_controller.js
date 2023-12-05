import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="star-bar"
export default class extends Controller {
  changeClass() {
    let starActivatedValues = [];
    let starActivated = document.getElementById('star-activated');
    let starHiddenValue = document.getElementById('rating');
    let starValues = document.querySelectorAll('[data-controller="star-bar"]');

    this.element.dataset.option = 'true';
    this.element.setAttribute('id', 'star-activated');
    this.element.setAttribute('class', 'bi bi-star-fill');
    starHiddenValue.setAttribute('value', this.element.getAttribute('value'));
    changeClassAnotherStar();

    if (starActivated) {
      starActivated.setAttribute('id', 'star-deactivated');
      starActivated.setAttribute('class', 'bi bi-star');
      starValues.forEach((el) => el.setAttribute('class', 'bi bi-star'));
    }

    function changeClassAnotherStar() {
      starValues.forEach((el) => {
        if (
          el.getAttribute('value') <
          document.getElementById('star-activated').getAttribute('value')
        ) {
          starActivatedValues.push(el);
        }
      });
      starActivatedValues.forEach((el) => el.setAttribute('class', 'bi bi-star-fill'));
    }
  }
}
