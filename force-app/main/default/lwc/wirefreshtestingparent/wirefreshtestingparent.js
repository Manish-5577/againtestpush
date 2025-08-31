import { LightningElement } from 'lwc';

export default class Wirefreshtestingparent extends LightningElement {
   feedintochildvar = 'test1';
    connectedCallback()
    {  console.log('test1');
   this.feedintochildvar = 'valuefromconnedtcallback'
    }
    constructor()
    {
        super();
        this.feedintochildvar = 'valuefromconstrtuctor';
    }
    renderedCallback()
    {
        this.feedintochildvar ='value from parent rendered  call back'
    }
}