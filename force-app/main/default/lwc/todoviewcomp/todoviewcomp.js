import { LightningElement,api } from 'lwc';

export default class Todoviewcomp extends LightningElement {

    @api recorddetail;

    handleClick(){
        console.log('this.recordid didd',this.recorddetail);
        console.log('this.recordid didd',this.recorddetail.Subject);
    }
   
    
}