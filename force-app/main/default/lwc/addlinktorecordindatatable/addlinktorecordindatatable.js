import { LightningElement,api } from 'lwc';

export default class Addlinktorecordindatatable extends LightningElement {

    @api value;
    @api recordId;
    @api recordName;
    
    handleclick(event)
    { 
      event.preventDefault();
         console.log('tttttt')
       // event.preventdefault();
       console.log('indexx in addlink comp '+this.index)
        const sentrecorid = new CustomEvent('receiveid',{
            detail :{
               recordid : this.recordId,
               recordName : this.recordName,
               value : this.value 
            },
            bubbles :true,
            composed : true,

        })
        this.dispatchEvent(sentrecorid);
    }
}