import { LightningElement,track } from 'lwc';

export default class Revisonpublicpropertyparent extends LightningElement {

  @track value;

  fetchvalue(event)
  {
    this.value = event.target.value;
  }
  performaction()
  {
    const childcomponent = this.template.querySelector('c-revisionpublicpropertychild');
   // console.log('value of ***'+this.test);
    const returnmssg = childcomponent.selectedfunc(this.value);
    console.log('value of %%%%'+this.test);
    console.log(returnmssg);
  }

}