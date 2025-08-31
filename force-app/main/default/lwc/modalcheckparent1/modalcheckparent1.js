import { LightningElement } from 'lwc';
export default class Modalcheckparent1 extends LightningElement {

renderchild = false
luuuuu = true
handleClick()
{ console.log('abcbcbcb')
   this.renderchild = true;

   
}
handleevent()
{  console.log('is it reqacjeded')
   this.renderchild = false;
}
renderedCallback(){
   console.log('child renderede d')
   console.log(this.template.querySelector('c-modal-reusable'));
   console.log('hureee rendered childdd')
}
}