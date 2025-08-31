import { LightningElement,api } from 'lwc';

export default class Eventtesingchild extends LightningElement {

@api publictest;

    handleClick()
    {
        const evennt = new CustomEvent("test",{detail:'idpassed!!!@@@mmmmm6666',composed : true,bubbles:true })
        this.dispatchEvent(evennt);
        //,bubbles:false,composed : true
    }





}