import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { duration: { type: Number, default: 5000 } }

  connect() {
    this.timeout = setTimeout(() => {
      this.element.style.opacity = "0"
      setTimeout(() => this.element.remove(), 300)
    }, this.durationValue)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
