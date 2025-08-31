import { LightningElement,api,track,wire } from 'lwc';
import { updateRecord,getRecord,getFieldValue } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import FName_FIELD from '@salesforce/schema/Contact.FirstName'
import LName_FIELD from '@salesforce/schema/Contact.LastName'
import Email_FIELD from '@salesforce/schema/Contact.Email'
import Id_FIELD from '@salesforce/schema/Contact.Id'
const FIELDS = [FName_FIELD,LName_FIELD,Email_FIELD,Id_FIELD]

export default class Updaterecordlwc extends LightningElement {

@api recordId;
@api contactrecord;
 fieldsvalue ={};
@wire(getRecord, {recordId :'$recordId',fields :FIELDS })
wiredaccount({data,error}){
    if(data){
        window.console.log(data);
        this.contactrecord = data;
    }
     else if(error)
     {
        let message = 'unknown Error';
        if(Array.isArray(error.body)){
            message = error.body.map(e=>e.message).join(', ');

        }
        else if(typeof error.body.message ==='string'){
            message = error.body.message;
        }
        this.__errors = message;
        window.console.error({
            title: 'Error',
            data :this.__errors
        })
     };
}

get fname(){
      return getFieldValue(this.contactrecord,FName_FIELD)
}
get lname(){
    return getFieldValue(this.contactrecord,LName_FIELD)
}
get email(){
    return getFieldValue(this.contactrecord,Email_FIELD)
}


updatehandle2(event)
{
     event.preventDefault;
         let name = event.target.name;
       //  alert('name is '+name+ 'value is '+ event.target.value );
       //s  console.log('name is '+name+ 'value is '+ event.target.value);
         let value = event.target.value;
         console.log('value is ++>',value);
         this.fieldsvalue[name] = value;
}





updatehandle(event){
     event.preventDefault;
    // alert('tetsts');
    const fields = {};
    fields[FName_FIELD.fieldApiName] = this.fieldsvalue.FirstName;
    fields[Id_FIELD.fieldApiName]  =this.recordId;
fields[LName_FIELD.fieldApiName] =  this.fieldsvalue.LastName;
fields[Email_FIELD.fieldApiName] =  this.fieldsvalue.Email;

  const recordInput = {fields};
  updateRecord(recordInput).then(()=>{
    this.dispatchEvent( new ShowToastEvent({
           title : 'Success',
           message: 'Contact Updated',
           variant : 'Success'
    }))
  }).catch(error=>{
    this.dispatchEvent( new ShowToastEvent({
        title : 'Error creating record',
        message: error.body.message,
        variant : 'error'
 }))
  })
}

}