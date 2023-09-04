import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = ["input", "preview"];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  preview() {
    // TODO: this
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onloadend = function () {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = 'default_avatar.png';
    }
  }
}