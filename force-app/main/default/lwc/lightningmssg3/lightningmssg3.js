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
import  messageDemo2 from '@salesforce/messageChannel/messageDemo2__c';

export default class Lightningmssg3 extends LightningElement {
   // mssgtopassfrom3to1
   subscription = null;
   @wire(MessageContext) msgContext;
   handlechange(event)
   {
    const messagePayload = {
        mssgtopassfrom3to1: event.target.value
      };
                  
      publish(this.msgContext, messageDemo1, messagePayload);
   }

   renderedCallback() {
    if (!this.subscription) {
    
      this.subscription = subscribe(
        this.msgContext,
        messageDemo2,
        msg1 => {
          this.messageHandler(msg1);
        },
        { scope: APPLICATION_SCOPE }
      );

    }
  }
 
messageHandler(mssgs)
  {
    console.log('what mssg coming from channel '+mssgs);
    console.log(mssgs);
       console.log('comp33==>'+mssgs.abcd);
       console.log('comp3kkk===>>'+mssgs.kkk);
       console.log('comp3kkk!@@@@===>>'+JSON.stringify(mssgs.kkl));
  this.receivedmssgfrom1stcompo = mssgs.mssgtopass;
  }

}