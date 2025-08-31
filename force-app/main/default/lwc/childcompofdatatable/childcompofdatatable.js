import { LightningElement,api } from 'lwc';
export default class Childcompofdatatable extends LightningElement {

@api childcontact;
@api childopportunity;


connectedCallback() {
         console.log('hhdhdhhd');
         console.log(this.childcontact);
         console.log('lllll@@@');
}
}