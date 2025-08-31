import { LightningElement,track,api } from 'lwc';
export default class ModalReusable extends LightningElement {



  
  isshowmodal = true;

    showModalBox() {  
        this.isshowmodal = true;
    }

    hideModalBox() {  
        this.isshowmodal = false;
       const selectedEvent = new CustomEvent("selected");
    // Dispatches the event.
    this.dispatchEvent(selectedEvent);
    }
     
    renderedCallback(){
      //  this.isshowmodal = true
    }
}