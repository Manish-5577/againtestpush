import { LightningElement,api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';
export default class Deletrecordlwc extends LightningElement {

@api recordId;

handledeleterecord(){
          deleteRecord(this.recordId).then(()=>{
             this.dispatchEvent( new ShowToastEvent({
                title :'Success',
                message :'Record Deleted',
                variant : 'success'
             }) ); 

             this[NavigationMixin.Navigate]({
                type:'standard__objectPage',
                attributes:{
                    actionName :"home",
                    objectApiName :"Contact"
                }
             })
          }).catch(()=>{
            this.dispatchEvent( new ShowToastEvent({
                title :'Error Deleting Record',
                message :error.body.message,
                variant : 'error'
             }) )
          })
    }
}