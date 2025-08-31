import { LightningElement,track } from 'lwc';

export default class Recordformlayoutfull extends LightningElement {

    @track recordid;
    handlesuccess(event){
        this.recordid = event.detail.id;
    }
}