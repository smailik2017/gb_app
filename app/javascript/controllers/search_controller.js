import { Controller } from "stimulus"
import Rails from "@rails/ujs";
import { end } from "@popperjs/core";

export default class extends Controller {
  static targets = ["query", "submitBtn", "orderBtn", "results"]

  submit(event) {
    event.preventDefault();
    const value = this.queryTarget.value;
    let order = 1;

    if (event.srcElement._ujsData["ujs:submit-button"].value == 'Search') {
      order = 0;
    }
  
    
    Rails.ajax({
      type: "GET",
      url: `/posts/search?query=${value}&order=${order}`,
      
      success: (_data, _status, xhr) => {
        if (this.hasResultsTarget) {
          this.resultsTarget.innerHTML = xhr.response;
          Rails.enableElement(this.submitBtnTarget);
          Rails.enableElement(this.orderBtnTarget);
        }
      }
    })
  }

  reset(event) {
    this.resultsTarget.innerHTML = "";
  }
}