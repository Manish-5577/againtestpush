import { LightningElement,track,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from "@salesforce/schema/Account.Name";
import OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
export default class Getrecord extends LightningElement {

@api recordId;
@api Name;
@track trackwiredata ;

@wire( getRecord, {recordId : '0015j00001dbbOtAAI', fields: [NAME_FIELD, INDUSTRY_FIELD]})
accountrecord({ data, error}){
 // this.trackwiredata = data;
  console.log('cominne')
    if(data){
        console.log('record Info',data);
        console.log(data);
        const Name = data.fields.Name.value;
        this.trackwiredata = data.fields.Name.value;
        console.log('company isisiss'+Name);
    }
    if(error){
        console.log(error);
    }
}

get name()
{ console.log('getter check!!!!!');
  return data.fields.Name.value;
}
  connectedCallback()
  {
    console.log('trackdata of wire service in connected call abck'+ this.trackwiredata);
  }
  renderedCallback()
  {
    console.log('trackdata of wire service in rendered call back'+ this.trackwiredata);
  }
}