import { LightningElement,api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class Beercartdetailchild extends LightningElement {

    @api item

    connectedCallback()
    {
        console.log('this itemmin child'+this.item);
        console.log(JSON.stringify(this.item));
        console.log(this.item.Beer__r.Name);
        console.log(this.item.Beer__r.Price__c);
    }
      handledelete()
      {console.log('is it coming!!!!!');
        this.dispatchEvent(new CustomEvent('deleteecartitem',{detail: this.item.Id}))
        //    deleteRecord(this.item.Id).then(()=>{
        //              console.log('delete successs!!!!!!!!!!!!!');
        //              this.dispatchEvent(new CustomEvent('deleteecartitem',{detail: this.item.Id
        // }))
        //    }).catch(()=>{
        //     console.log('delete failure')
        //    })  
      }
}