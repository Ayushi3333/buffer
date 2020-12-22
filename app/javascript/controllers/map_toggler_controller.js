import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'buddyView', 'toggleButton' ]
  connect(){ 
    console.log('connected')

  }
  toggle() {
    this.mapViewTarget.classList.toggle('d-none')
    this.buddyViewTarget.classList.toggle('d-none')
    if(this.toggleButtonTarget.innerHTML === 'View map<i class="fas fa-map-marked-alt ml-2"></i>'){
      this.toggleButtonTarget.innerHTML = 'View list<i class="fas fa-stream ml-2"></i>'
    }
    else {
      this.toggleButtonTarget.innerHTML = 'View map<i class="fas fa-map-marked-alt ml-2"></i>'
    }
  }
}