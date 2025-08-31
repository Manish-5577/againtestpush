import LightningDatatable from 'lightning/datatable';
import imagetemplate from './templates/image.html';
import picklisttemplate  from './templates/picklisttemplate.html';
import addlink from './templates/addlink.html';
import lookup from './templates/lookup.html';
export default class Lightningdatatableextended extends LightningDatatable {

    static customTypes = {
                 image :{
                    template : imagetemplate,// the html file that will get rendered
                    typeAttributes :['height','width','alt']
                 },
                 picklist :{
                    template:picklisttemplate,
                    typeAttributes :["objectApiName","label","placeholder","options","index",'name',"variant"]
                 },
                 lookup:
                 {
                    template: lookup,
                    typeAttributes :["objectApiName","label","placeholder","recordId","recordName"]
                 },
                 addlink:
                 {
                  template :addlink,
                  typeAttributes : ["recordId","recordName"]
                 }

                 
    }

    handlechange(event)
    {  event.preventDefault();
        const select = new CustomEvent('seelect', {detail : 
            {value: event.target.value},
            bubbles :true,
            composed :true

    })
    this.dispatchEvent(select)
    }
}