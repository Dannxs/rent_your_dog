import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['accept', 'acceptForm', 'refuseForm', 'history', 'cancelForm', 'rental'];

  connect() {
    console.log(this.element);
    console.log(this.acceptTarget);
    console.log(this.formTarget);
  }

  send(event) {
    event.preventDefault();
    fetch(event.currentTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.acceptTarget.innerHTML = data.inserted_item;
        this.historyTarget.innerHTML = data.history_item;
        this.rentalTarget.innerHTML = data.rental_item;
      });
  }
}
