import { LightningElement,api,wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import {fireEvent}  from 'c/pubsub';
import {registerListener}  from 'c/aurapubsub';

import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Publicpropertyrevision extends LightningElement {
  @wire(CurrentPageReference) pageRef;  
  @api meetingroominfo ={roomcapacity:'12',roomname:'A12'};
  @api booleaneg = false;
  mssgreceivedfromaura;
  tileclicked(){
    const tileclickeds = new CustomEvent('anyeventname',{detail: this.meetingroominfo});
    this.dispatchEvent(tileclickeds);// note this is same as firing event
    fireEvent(this.pageRef,'pubsubeg',this.meetingroominfo);
  }

  connectedCallback(){
    //alert('test how many called');
//registerListener('testaura',this.callBackMethod,this);
}
callBackMethod(payload){
//this.mssgreceivedfromaura = payload;
//alert('mssg received from aura where aura fired event ==>'+JSON.stringify(payload));
//console.log('listener page ref==>'+JSON.stringify(this.mssgreceivedfromaura));
}
   
}