import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Eventtesingparent extends LightningElement {



    letsee(event)
    {
       alert(JSON.stringify(event));
       console.log(JSON.stringify(event.detail));
       
    }
}