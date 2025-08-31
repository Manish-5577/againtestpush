import { LightningElement } from 'lwc';

export default class Eventtesinggreatparent extends LightningElement {

    letsee2(event)
    {
       console.log('is it comingg '+JSON.stringify(event.detail));
    }
}