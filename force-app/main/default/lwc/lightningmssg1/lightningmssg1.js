import { LightningElement,wire } from 'lwc';
import {
    APPLICATION_SCOPE,
    createMessageContext,
    MessageContext,
    publish,
    releaseMessageContext,
    subscribe,
    unsubscribe,
} from 'lightning/messageService';
import messageDemo1 from '@salesforce/messageChannel/messageDemo1__c';
import messagedemo2 from '@salesforce/messageChannel/messageDemo2__c';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Lightningmssg1 extends LightningElement {
      mssgreceivedfrom3rdcomponent
    @wire(MessageContext) msgContext;
kk = [1,2,3,4,5,6]
objj = {name:'maniii',ss:'k2k323'}
//subscription = null;
    handlechange(event)
    {
       let  messagepayload  = {
        mssgtopass : event.target.value,
        abcd : event.target.value,
        kkk:this.kk,
        kkl :this.objj
       }
       let  messagepayload2  = {
        mssgtopass : event.target.value,
        abcd : event.target.value,
        kkk:['a','b','c','d'],
        kkl :{nami :'mrrrr',agege:444}
       
       }
       let  messagepayload3  = {
        mssgtopass : event.target.value,
        abcd : event.target.value,
        kkk:['ar','bb','cc','dr'],
        kkl :{namieeerr :'mrrrffffr',agege:6677}
       }
          console.log('mssg context==>'+JSON.stringify(this.msgContext));
        publish(this.msgContext, messageDemo1, messagepayload);
        publish(this.msgContext, messageDemo1, messagepayload2);
        publish(this.msgContext, messageDemo1, messagepayload3);
    //    publish(this.msgContext, messagedemo2, messagepayload3);
    }
    subscription = null;

  connectedCallback() {
   
    if (!this.subscription) {
      this.subscription = subscribe(
        this.msgContext,
        messageDemo1,
        msg => {
          this.messageHandler(msg);
        },
        { scope: APPLICATION_SCOPE }
      );
    }
  }
  messageHandler(mssg)
  {
    this.mssgreceivedfrom3rdcomponent= mssg.mssgtopassfrom3to1;
  }

 
}