import { LightningElement,track } from 'lwc';
import Nam_FIELD from '@salesforce/schema/Account.Name';
import phn_FIELD from '@salesforce/schema/Account.Phone';
import website_FIELD from '@salesforce/schema/Account.Website';
export default class Ldsformimportfieldfromsalesforce extends LightningElement {

    @track recordid;
    fieldsArray = [Nam_FIELD, phn_FIELD, website_FIELD];

    handlesuccess(event)
    {
        this.recordid = event.detail.id;
    }
}