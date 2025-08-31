import { LightningElement,api,track } from 'lwc';

export default class Searchcomp extends LightningElement {

    @api searchLabel = "Search Account";
    @api showLabel = "true";
@track searchkeyword;
    handlechange(event){
            this.searchkeyword = event.target.value;
        const pracsearchevent = new CustomEvent(
            'pracsearch', {detail: this.searchkeyword},
        );
        this.dispatchEvent(pracsearchevent);
        console.log('eventdispatched at search component',this.searchkeyword);
    }
}