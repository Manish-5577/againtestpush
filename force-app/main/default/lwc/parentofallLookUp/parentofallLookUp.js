import { LightningElement } from 'lwc';

export default class ParentofallLookUp extends LightningElement {



    handleselectederecordid(event){
  console.log('let what is the selected id is ',event.detail);
  var recordid  = event.detail;
  const selectevent  = new CustomEvent(
    'select3',{
        detail :recordid
    }
);
this.dispatchEvent(selectevent);
console.log('event displatched3');
    }
}