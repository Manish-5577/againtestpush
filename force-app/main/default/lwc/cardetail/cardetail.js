import { LightningElement,wire,api,track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import {registerListener, unregisterAllListeners } from 'c/pubsub';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import {  CurrentPageReference }  from 'lightning/navigation'

import CAR_ID from '@salesforce/schema/Car__c.Id';
import CAR_NAME from '@salesforce/schema/Car__c.Name';
import CAR_MILEAGE from '@salesforce/schema/Car__c.Mileage__c';
import CAR_PER_DAY_RENT from '@salesforce/schema/Car__c.Per_Day_Rent__c';
import CAR_BUILD_YEAR from '@salesforce/schema/Car__c.Build_Year__c';
import CAR_PICTURE from '@salesforce/schema/Car__c.Picture__c';
import CAR_CONTACT_NAME from '@salesforce/schema/Car__c.Contact__r.Name';
import CAR_TYPE_NAME from '@salesforce/schema/Car__c.Car_Type__r.Name'; 
import CAR_CONTACT_EMAIL from '@salesforce/schema/Car__c.Contact__r.Email';
import CAR_CONTACT_PHONE from '@salesforce/schema/Car__c.Contact__r.HomePhone';

const fields =[
    CAR_ID,CAR_NAME,CAR_MILEAGE,
    CAR_PER_DAY_RENT,CAR_BUILD_YEAR,
    CAR_PICTURE,CAR_CONTACT_NAME,
    CAR_CONTACT_EMAIL,CAR_CONTACT_PHONE,CAR_TYPE_NAME
]

export default class Cardetail extends LightningElement {


@track selectedTabValue;
cardId;

@wire(CurrentPageReference) pageRef;
   
@wire(getRecord,{recordId:'$cardId',fields})
car;

connectedCallback(){
           alert('test how many called');
    registerListener('carselect',this.callBackMethod,this);
    console.log('what is this==>'+JSON.stringify(this));
}
callBackMethod(payload){
    this.cardId = payload;
    console.log('listener page ref==>'+JSON.stringify(this.pageRef));
}

disconnectedCallback(){
    unregisterAllListeners(this);
    alert('what happen when disconnected');
}
handlevieww(){
    console.log('4555558888ddhhdhdhd');
    const findexperiencecomp = this.template.querySelector('c-viewexperience');
    if(findexperiencecomp){
        console.log('7777777778888ddhhdhdhd');
        findexperiencecomp.getexperince();
    }
    this.selectedTabValue = "viewexperience";
    console.log('8888888888ddhhdhdhd');
}
tabChangeHandler(event){
this.selectedTabValue = event.target.value;
}

    get carFound(){
        if(this.car.data){
            return true;
        }
        return false;
    }
}