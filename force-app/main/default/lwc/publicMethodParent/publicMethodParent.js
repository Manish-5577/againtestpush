import { LightningElement,track } from 'lwc';

export default class PublicMethodParent extends LightningElement {
   @track value;

   performaction(){
    const childcomponent = this.template.querySelector('c-publicmethodchild');
    console.log('value of ***'+this.value);
    const returnedmssg = childcomponent.selectcheckbox(this.value);
    console.log(returnedmssg);
   }
   test(event){
            this.value = event.target.value;
            console.log('%%%%'+this.value);
   }
}