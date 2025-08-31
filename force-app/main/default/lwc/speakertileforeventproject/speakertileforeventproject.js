import { LightningElement,api } from 'lwc';

export default class Speakertileforeventproject extends LightningElement {



    @api speaker;
                renderedCallback()
                {
                    console.log('this speakerinfo===>'+JSON.stringify(this.speaker));
                    console.log('speaker.Picture__c==>'+this.speaker.Speaker__r.Picture__c);
                }

}