import { LightningElement,track } from 'lwc';

export default class Fireeventpractparent extends LightningElement {

@track childvaluee;

    handleevent(event)
    {
         this.childvaluee = event.detail;
    }
}