import { LightningElement,wire,api} from 'lwc';
import { CurrentPageReference } from "lightning/navigation";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Navigationallowedd extends LightningElement {


    @wire(CurrentPageReference)
    currentPageRef;
  
    @api propertyValue;
  
    get propertyValue() {
        alert('lalala'+this.currentPageRef.state.c__propertyValue)
      return this.currentPageRef.state.c__propertyValue;
    }
}