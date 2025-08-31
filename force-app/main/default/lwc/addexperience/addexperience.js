import { LightningElement,api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';


import NAME_FIELD from '@salesforce/schema/Car_Experience__c.Name';
import EXPERIENCE_FIELD from '@salesforce/schema/Car_Experience__c.Experience__c';
import CAR_FIELD from '@salesforce/schema/Car_Experience__c.Car__c';
import EXPERIENCE_OBJECT from '@salesforce/schema/Car_Experience__c';




export default class Addexperience extends LightningElement {

    @api cardid;
title='';
inputdescription='';

    handleTitleChange(event){
  this.title = event.target.value;
    }
    handleDescriptionChange(event){
        this.inputdescription = event.target.value;
    }

    addExperience(){
   const fields ={};

   fields[NAME_FIELD.fieldApiName] = this.title;
   fields[EXPERIENCE_FIELD.fieldApiName] = this.inputdescription;
   fields[CAR_FIELD.fieldApiName] = this.cardid;


   const requiredinput = {apiName:EXPERIENCE_OBJECT.objectApiName,fields};
   createRecord(requiredinput).then(resposne =>{ 
       console.log('record has been succesfully created with id  ');
     this.showToast('success','record created successfully','success');
     const evennfirr = new CustomEvent('firetiviewexpe');
this.dispatchEvent(evennfirr);
console.log('testtseventdispatch');
   }).catch(error=>{
      // console.error('error roccured due to this reason!!!!!!!!!!s', error.body.message);

this.showToast('error',error.body.message,'error')

   });
  



    }


    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title: title,
            message:message
               ,
               variant : variant,
        });
        this.dispatchEvent(event);
    
    }
}