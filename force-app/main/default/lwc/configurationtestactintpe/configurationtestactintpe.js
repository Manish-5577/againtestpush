import { LightningElement,api } from 'lwc';

export default class Configurationtestactintpe extends LightningElement {

    @api test1
    @api test2 = {abc:1,xyz : 2}
    
    @api invoke() {
        console.log("Hi, I'm an action.");
      }

}