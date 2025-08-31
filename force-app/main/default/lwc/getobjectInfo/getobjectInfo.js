import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
export default class GetobjectInfo extends LightningElement {

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    propertyOrFunction({data,error})
    {
        if(data)
        {  console.log('data');
            console.log(data);
        }
    }
}