import { LightningElement,api,track,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

//import { NavigationMixin } from 'lightning/navigation';
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from "@salesforce/schema/Account.Name";
import OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
export default class Lifecyclehookschild extends NavigationMixin(LightningElement) {
@api  parentvalue ;
hasRendered = true;
@track renderedvalue ;
@track connectedvalue ;
noofrecord = 4;
privateprr;


@wire(getRecord, {
    recordId: "0015j00001Zo1LcAAJ",
    fields: [NAME_FIELD, INDUSTRY_FIELD],
    optionalFields: [PHONE_FIELD, OWNER_NAME_FIELD],
  })
  account({data,error})
  {
    if(data)
    {  console.log('wire fired or not child');
     console.log(data);
      //  alert('wire called');
    }
  }
    constructor()
    {
        super();
   
    }
    connectedCallback()
    {
        console.log('child connected call back')
        getallaccount({num:this.noofrecord}).then(resposnse=>{
            this.accounts = resposnse;
            console.log('this account connected child'+this.accounts);
            const toastevent =new ShowToastEvent({
               title : 'Account Feched',
               mesaage : this.noofrecord + ' Account suv=ccesfully fetched from server',
               variant : 'Success'
            });
            this.dispatchEvent(toastevent);
               }).catch(error =>{
                   console.log('error reason is',error.body.message);
       
                   const toastevent =new ShowToastEvent({
                       title : 'Error',
                       mesaage : error.body.message,
                       variant : 'error'
                    });
                    this.dispatchEvent(toastevent);
               })
       
    }
    
    renderedCallback()
    { 
        console.log('child rendered callback');
        getallaccount({num:this.noofrecord}).then(resposnse=>{
            this.accounts = resposnse;
            console.log('this account rendered child'+this.accounts);
            const toastevent =new ShowToastEvent({
               title : 'Account Feched',
               mesaage : this.noofrecord + ' Account suv=ccesfully fetched from server',
               variant : 'Success'
            });
            this.dispatchEvent(toastevent);
               }).catch(error =>{
                   console.log('error reason is',error.body.message);
       
                   const toastevent =new ShowToastEvent({
                       title : 'Error',
                       mesaage : error.body.message,
                       variant : 'error'
                    });
                    this.dispatchEvent(toastevent);
               })
      

    }
    disconnectedCallback()
    {
        console.log('child disconnedted ');
        alert('this parent va;ue disconnected '+this.parentvalue);
      //  alert('disconnected call back child d');
    }
    errorCallback(error,stack)
    {
        console.log('reasom for error in child')
    }


   

}