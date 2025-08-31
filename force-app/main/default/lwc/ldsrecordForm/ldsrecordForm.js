import { LightningElement,track } from 'lwc';

export default class LdsrecordForm extends LightningElement {

    @track recordid;
    fieldsArray = ['Name','Phone','website','Industry','Rating'];
    handlesuccess(event)
    {
        this.recordid = event.detail.id;
    }
}