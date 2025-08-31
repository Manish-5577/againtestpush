import { LightningElement,wire,track } from 'lwc';
import messageDemo1 from "@salesforce/messageChannel/messageDemo1__c";
import  messageDemo2 from '@salesforce/messageChannel/messageDemo2__c';
import {
  MessageContext,
  publish,
  subscribe,
  unsubscribe,
  APPLICATION_SCOPE
} from "lightning/messageService";
export default class Lightningmssg4 extends LightningElement {
     object22 = {firstname : 'manishh',lastname :'chaudhary'};
@track objecttt = [{firstname : 'manishh88',lastname :'chaudhary'}];
    receivedmssgfrom1stcompo;

    subscription = null;

    @wire(MessageContext) msgContext;

  renderedCallback() {
    if (!this.subscription) {
      console.log('how many time it entered');
      this.subscription = subscribe(
        this.msgContext,
        messageDemo1,
        msg => {
          this.messageHandler(msg);
        }
          
        
      
      );
        
      this.subscription = subscribe(
        this.msgContext,
        messageDemo2,
        msg1 => {
          this.messageHandler2(msg1);
        }
        
      );

    }
  }
  messageHandler(mssgs)
  {
    console.log('what mssg coming from channel '+mssgs);
    console.log(mssgs);
       console.log('abcddd==>'+mssgs.abcd);
       console.log('kkk===>>'+mssgs.kkk);
       console.log('kkk!@@@@===>>'+JSON.stringify(mssgs.kkl));
  this.receivedmssgfrom1stcompo = mssgs.mssgtopass;
  }
  messageHandler2(mssgs)
  {
    console.log('what messagehandlerr222 '+mssgs);
    console.log(mssgs);
       console.log('abcddd messagehandlerr22==>'+mssgs.abcd);
  this.receivedmssgfrom1stcompo = mssgs.mssgtopass;
  }
  handlechange()
  {
     //this.objecttt[0].firstname = 'event.target.value@@@;'
    //this.objecttt[0].firstname = 'changes without track'
   //this.objecttt[0] = {firstname :'manishwithout trackk',lastname : 'chaudhryy444'};
    // this.object22.firstname = 'updated  without track'
   // this.object22 = { firstname : 'John###', lastname : 'Doe' };
   this.object22.firstname = 'withouttrack';
  }
}