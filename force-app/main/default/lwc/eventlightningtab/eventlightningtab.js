import { LightningElement,track } from 'lwc';
	
import { NavigationMixin} from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Eventlightningtab extends NavigationMixin(LightningElement) {


        @track recordidd;
        handleSuccess(event)
        {   console.log('record id is '+event.detail.id);
        //console.log('record id is '+JSON.stringify(event.detail));
            this.recordidd = event.detail.id;
         // console.log('event organiserdetails ==>',event.detail.Event_Organizer__r.value,'deatill',event.detail);
         const payload = event.detail;            
        var objJSON = JSON.parse(JSON.stringify(payload));  
        alert(objJSON["fields"]["Event_Organizer__c"]["value"]);
      //  this.accountId = event.detail.id;
       // alert('this.acountid ==>#####',event.detail.id);
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes: {
                objectApiName: 'Event__c',
                actionName: 'view',
                recordId :this.recordidd 
               
            }
        });
    }
    }