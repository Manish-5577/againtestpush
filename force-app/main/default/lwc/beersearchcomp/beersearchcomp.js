import { LightningElement } from 'lwc';

export default class Beersearchcomp extends LightningElement {

    searchvalue;

    handlechange(event)
    {
        let val = event.target.value;
        const sentusertext = new CustomEvent('reciveusertext',{
            detail : val
        })
        this.dispatchEvent(sentusertext);
    }

}