import { LightningElement,wire } from 'lwc';
import field1forchannel1 from  '@salesforce/messageChannel/field1forchannel1__c'
import {publish,subscribe,MessageContext} from 'lightning/messageService';
export default class Lms1 extends LightningElement {

@wire(MessageContext)
lmscontext

subscription
handleClick()
{  console.log('lalallal');
    const mssg = {
        lmsone: 'msgfromlms',
        source : 'lwc system'
    }
    publish(this.lmscontext,field1forchannel1,mssg)
    console.log('isit coming')
}
  connectedCallback() {
   
    if (!this.subscription) {
      this.subscription = subscribe(
        this.lmscontext,
        field1forchannel1,
        msg => {
          this.messageHandler(msg);
        }
      );
    }
  }
  messageHandler(mssg)
  {
    console.log(mssg);
    console.log('lalalla 22');
  }
}