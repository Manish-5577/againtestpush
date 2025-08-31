import { LightningElement,wire } from 'lwc';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
export default class Getrecordfinalapproachpart3 extends LightningElement {

    accountdata;
    @wire(getRecord,{recordId:"0015j000019aHjiAAE",fields :[NAME_FIELD, INDUSTRY_FIELD]})
    accountrecord({data,error})
    {
        if(data){
            console.log('final approach 33');
            console.log(data);
            this.accountdata = data;
        }
        else if(error)
        { console.log('error reason ');
            console.log(error);
        }
    }
    get indus()
    {
        return this.accountdata.fields.Industry.value;
    }
     get name()
     {
        return this.accountdata.fields.Name.value;
     }
}