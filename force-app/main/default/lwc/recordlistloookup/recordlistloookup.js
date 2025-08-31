import { LightningElement,api } from 'lwc';

export default class Recordlistloookup extends LightningElement {

    @api record;
  @api iconname;
  @api parentid;
    handleclick(){
        if(this.record){
            console.log('$$$$$$$$$$$$$$$$$$$',this.record);
      //  console.log('$$$$$$$$$$$$$$$$$$$',this.record[0].Name);
        }; 
        const selectevent  = new CustomEvent(
            'select',{
                detail :this.record.Id,

            }
        );
        this.dispatchEvent(selectevent);
        console.log('event displatched');
        const selectevent2  = new CustomEvent(
            'selectnnn',{
                detail :this.record,
                
            }
        );
        this.dispatchEvent(selectevent2);
     }
}