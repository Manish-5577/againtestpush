import { LightningElement,wire } from 'lwc';
import {registerListener, unregisterAllListeners } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation'

export default class Pubsubapplication1 extends LightningElement {

Mssgreceivedfromvispubsub
    @wire(CurrentPageReference) pageRef;
    connectedCallback(){
        
 registerListener('pubsub',this.callBackMethod,this);
 
}
callBackMethod(mssgreceived)
 {
  this.Mssgreceivedfromvispubsub = mssgreceived;
 }
disconnectedCallback(){
    unregisterAllListeners(this);
}

}