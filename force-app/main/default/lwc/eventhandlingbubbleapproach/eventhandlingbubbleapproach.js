import { LightningElement,api } from 'lwc';

export default class Eventhandlingbubbleapproach extends LightningElement {
    @api meetingroominfo ={roomcapacity:'12',roomname:'A12'};
    @api booleaneg = false;
    @api testreernce = {};

    abc = {one:1, two : 2}
    tileclicked(){
      const tileclickeds = new CustomEvent('anyeventname',{detail: this.meetingroominfo,bubbles:true,composed : false});
      this.dispatchEvent(tileclickeds);// note this is same as firing event
  
      this.dispatchEvent(new CustomEvent('compulsory',{detail : this.abc,bubbles : true, composed: true}))
    }
  
    connectedCallback(){
      console.log('==testrere'+this.abc);
     
    }
    handlechange()
    {
      console.log('this is abc!@@@@@! '+JSON.stringify(this.abc));
    }
}