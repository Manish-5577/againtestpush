import { LightningElement,api } from 'lwc';

export default class Customsearchlwc extends LightningElement {

    @api searchvalue;

    handlechange(event){
        this.searchvalue = event.target.value;

        const searchevent = new CustomEvent(
            'search', {detail: this.searchvalue},
        );
        this.dispatchEvent(searchevent);
    }
}