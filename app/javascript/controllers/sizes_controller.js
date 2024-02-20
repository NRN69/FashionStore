import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="sizes"
export default class extends Controller {
  changeclass() {
    const elActivated = document.getElementById('activated');

    this.element.dataset.option = 'true';
    this.element.setAttribute('id', 'activated');
    this.element.setAttribute('class', 'activated');

    if (elActivated) {
      elActivated.setAttribute('id', 'deactivated');
      elActivated.setAttribute('class', '');
    }
  }
}
