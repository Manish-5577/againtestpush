import { LightningElement,track } from 'lwc';

export default class Ldsrecordeditform extends LightningElement {

    @track recordidd;
    handleSuccess(event)
    {   console.log('record id is '+event.detail.id);
        this.recordidd = event.detail.id;
    }
}