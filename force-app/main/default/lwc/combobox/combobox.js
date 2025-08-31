import { LightningElement,api } from 'lwc';

export default class Combobox extends LightningElement {
    @api name;
    @api label
    @api value
    @api  placeholder
    @api options
   @api variant
    handlechange(event)
    {
        event.preventDefault();
        const select = new CustomEvent('seelect', {detail : 
            {value: event.target.value,
                index :this.index
            },
            bubbles :true,
            composed :true

    })
    this.dispatchEvent(select);
    }
}