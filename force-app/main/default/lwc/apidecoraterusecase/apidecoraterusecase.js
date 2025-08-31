import { LightningElement,track,wire } from 'lwc';

export default class Apidecoraterusecase extends LightningElement {

    @track parentvalue;

    handlechange(event)
    {
   this.parentvalue = event.target.value;
    }


}