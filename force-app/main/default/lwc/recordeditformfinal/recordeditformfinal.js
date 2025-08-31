import { LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import rating_FIELD from '@salesforce/schema/Account.Rating';
import carrr_FIELD from '@salesforce/schema/Account.Car__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Recordeditformfinal extends LightningElement {
name = NAME_FIELD;
rating = rating_FIELD;
carr = carrr_FIELD;
accountId;
spinnnertrue = false;
handleSuccess(event){
    this.spinnnertrue = false;
    this.accountId = event.detail.id;
    alert('account created successfully '+  this.accountId)
}

handlesubmit()
{
   this.spinnnertrue = true;
}
}