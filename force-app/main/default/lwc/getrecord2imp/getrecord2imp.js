import { LightningElement,api,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import Name_FIELD from '@salesforce/schema/Account.Name'
import Phone_FIELD from '@salesforce/schema/Account.Phone'
import Website_FIELD from '@salesforce/schema/Account.Website'
import Industry_FIELD from '@salesforce/schema/Account.Industry'

const FIELDS = ['Account.Type',Name_FIELD,Phone_FIELD,Website_FIELD,Industry_FIELD]
export default class Getrecord2imp extends LightningElement {

@api recordId;
@api accountRecord;
__errors;
@wire(getRecord, {recordId :'$recordId',fields :FIELDS })
wiredaccount({data,error}){
    if(data){
        window.console.log(data);
        this.accountRecord = data;
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

get name(){
      return getFieldValue(this.accountRecord,Name_FIELD)
}
get Phone(){
    return getFieldValue(this.accountRecord,Phone_FIELD)
}
get Website(){
    return getFieldValue(this.accountRecord,Website_FIELD)
}

get Industry(){
    return getFieldValue(this.accountRecord,Industry_FIELD)
}
get type(){
    return getFieldValue(this.accountRecord,'Account.Type')
}
get AnotherType()
{  let value ='';
if(this.accountRecord){
    value = this.accountRecord.fields.Type.value;
}
    return value;
}

}