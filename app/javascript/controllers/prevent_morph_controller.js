import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static values = { attribute: String };
    connect() {
        this.element.addEventListener("turbo:before-morph-attribute", (event) => {
            if (event.detail.attributeName == this.attributeValue) {
                event.preventDefault();
            }
        });
    }
}
