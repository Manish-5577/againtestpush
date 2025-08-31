import { LightningElement,track,wire } from 'lwc';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
export default class Fireeventpract extends LightningElement {


@track childvalue
      
handlechange(event)
{
         const childval = event.target.value;
          const cartypeselectionchange = new CustomEvent('eventnameanything',{detail:childval});
this.dispatchEvent(cartypeselectionchange);
}

@wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
  results({ error, data }) {
    if (data) {
        console.log('getobjectinfo');
        console.log(data);
      this.accountRecordTypeId = data.defaultRecordTypeId;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.accountRecordTypeId = undefined;
    }
  }
}