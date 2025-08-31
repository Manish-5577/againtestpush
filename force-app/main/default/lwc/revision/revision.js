import { LightningElement,track,api } from 'lwc';

export default class Revision extends LightningElement {


   @track name = {
        age : 98,
        avg : 13
    }
    chekit(event){
        this.name.age = event.target.value;
        this.name.avg = event.traget.value;
    }
}