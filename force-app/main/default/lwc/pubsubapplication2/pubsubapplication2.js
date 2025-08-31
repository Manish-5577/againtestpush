import { LightningElement,wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation'
import { fireEvent } from 'c/pubsub'; 
export default class Pubsubapplication2 extends LightningElement {

    @wire(CurrentPageReference) pageRef;


    handlechange(event)
     {
        fireEvent(this.pageRef,'pubsub',event.target.value);
     }
    
}