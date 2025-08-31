import { LightningElement,wire,track } from 'lwc';
import rating_FIELD from '@salesforce/schema/Account.Rating';
import NAME_FIELD from '@salesforce/schema/Account.Name';
//import email_FIELD from '@salesforce/schema/Account.Email';securitycheck__c
import phone_FIELD from '@salesforce/schema/Account.Phone';
import security_FIELD from '@salesforce/schema/Account.securitycheck__c';
import industry_FIELD from '@salesforce/schema/Account.Industry';
import LastModifiedById_FIELD from '@salesforce/schema/Account.CreatedBy.LastModifiedById';
//import stage from '@salesforce/schema/Account.stage__c';
import { getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Lightningdataservicepract extends LightningElement {

    fieldsd = [NAME_FIELD,phone_FIELD,industry_FIELD,rating_FIELD,security_FIELD,LastModifiedById_FIELD];
    rating = NAME_FIELD;
     modifiedby = LastModifiedById_FIELD;
   @track  stage ;
    @wire(getPicklistValuesByRecordType, {
        objectApiName: "Account",
        recordTypeId: "0125j000001tlYBAAY",
      })
      propertyOrFunction({data,error}){
        if(data){
        console.log('data is ==>',data);
        alert('tttestst'+JSON.stringify(data.picklistFieldValues.stage__c.values));
     this.stage = data.picklistFieldValues.stage__c.values;
        }
      }

  

   // stages = stage;
}