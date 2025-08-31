import { LightningElement, track, wire } from "lwc";
import messageDemo from "@salesforce/messageChannel/messageDemo__c";
import {
  MessageContext,
  publish,
  subscribe,
  unsubscribe,
  APPLICATION_SCOPE
} from "lightning/messageService";

export default class Messagingservice extends LightningElement {
  @track messages = [];

  @wire(MessageContext) msgContext;

  subscription = null;

  connectedCallback() {
    if (!this.subscription) {
      alert('messag e context in listener'+JSON.stringify(this.msgContext));
      this.subscription = subscribe(
        this.msgContext,
        messageDemo,
        msg => {
          this.messageHandler(msg);
        }, 
        );
      
    }
   
  }

  disconnectedCallback() {
    unsubscribe(this.subscription);
    this.subscription = null;
  }

  sendHandler() {
    const inputElement = this.template.querySelector("lightning-input");
    if (inputElement) {
      const msg = inputElement.value;
      this.messages.push({
        id: this.messages.length,
        value: msg,
        from: "LWC"   
      });
      //publish message
      const messagePayload = {
        message33: msg,
        from: "LWC"
      };
    
      publish(this.msgContext, messageDemo, messagePayload);
     alert('msg context object==>'+JSON.stringify(this.msgContext));
     
      inputElement.value = "";
    }
  }

  messageHandler(msgPayload) {
    //something with message
    if (msgPayload && msgPayload.from !== "LWC") {
      this.messages.push({
        id: this.messages.length,
        value: msgPayload.message,
        from: msgPayload.from
      });
    }
  }
  handlemssgcontext()
  {
    alert('msg context object==>'+JSON.stringify(this.msgContext));
  }
}