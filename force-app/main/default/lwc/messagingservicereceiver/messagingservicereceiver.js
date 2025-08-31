import { LightningElement,wire,track } from 'lwc';
import messageDemo from "@salesforce/messageChannel/messageDemo__c";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import {
    subscribe,
    unsubscribe,
    
    MessageContext,
  } from "lightning/messageService";
export default class Messagingservicereceiver extends LightningElement {
    subscription = null;
   @track receivedmssg = '';
    @wire(MessageContext)
    messageContext;
                  
    subscribeToMessageChannel() {
       alert('checkingg');
        if (!this.subscription) {
          this.subscription = subscribe(
            this.messageContext,
            messageDemo,
            (messagePayload) => this.handleMessage(messagePayload),
                )
                    
        }
      }
    
      unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
      }
    
      // Handler for message received by component
      handleMessage(message) {
       alert(JSON.stringify(message));
       this.receivedmssg = message.message33;
      }
    
      // Standard lifecycle hooks used to subscribe and unsubsubscribe to the message channel
      connectedCallback() {
        alert('callback');
        this.subscribeToMessageChannel();
      }
    
      disconnectedCallback() {
        this.unsubscribeToMessageChannel();
      }
}