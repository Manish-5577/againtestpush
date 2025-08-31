import { LightningElement,api } from 'lwc';

export default class Practrecord extends LightningElement {
    @api rec;

    @api iconname = "standard:account";
  
    @api parentidfield;

    handleSelect(){
        console.log('practrecord component entered');
        let selectedrecord = new CustomEvent(
            "pracsele",{

                detail: {
          
                  selRec: this.rec,
          
                  parent: this.parentidfield
                                   
                }
          
              }
        )
        this.dispatchEvent(selectedrecord);
        console.log('event dispatch at recordcomponent',this.rec);

    }


}