import { map } from "jquery";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'buddyView', 'toggleButton', 'main', 'map' ]
  connect(){ 
   }
  mapToggle = true;
  toggle() {
    if(this.mapToggle === true){
      this.toggleButtonTarget.innerHTML = 'View list <i class="fas fa-stream"></i>'
      this.mapViewTarget.style.display = 'block'
      this.buddyViewTarget.style.display = 'none'
      this.mapToggle = false
    }else{
      this.toggleButtonTarget.innerHTML = 'View map <i class="fas fa-map-marked-alt"></i>'
      this.mapViewTarget.style.display = 'none'
      this.buddyViewTarget.style.display = 'block'
      this.mapToggle = true
    }
  }
}