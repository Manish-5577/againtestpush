import { LightningElement,api,track,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import { NavigationMixin } from 'lightning/navigation';
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from "@salesforce/schema/Account.Name";
import OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
export default class Lifecyclehookss extends LightningElement  {
 privatevar;
@track passvalue ='999';
@track hasRendered = true;
@track properties;
 @api test ;
 checck = '';
 iftrue2 = false;
 noofrecord = 4;
 truee = false;
 bool = false;
 passrecordid ='0015j00001Zo1LcAAJ';
     record;
 @wire(getRecord, {
    recordId: '$passrecordid',
    fields: [NAME_FIELD, INDUSTRY_FIELD],
    optionalFields: [PHONE_FIELD, OWNER_NAME_FIELD],
  })
  account({data,error})
  {   console.log('OUtside wire get executed ');
    if(data)
    {  console.log('Inside wire fired or not');
     console.log(data);
      //  alert('wire called');
    }
  }

    constructor()
    {
        super();
        console.log('constructor get called');
        console.log('Outside contructor callback parent');
        getallaccount({num:this.noofrecord}).then(resposnse=>{
            this.accounts = resposnse;
            this.record = resposnse;

            console.log(resposnse);
            console.log('constrcutor');
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
               console.log('this account connected in constructor'+this.accounts);
     
    }
    noofrecordss(event)
    {
      console.log('what is '+event.target.value);
      this.truee = true;
 // this.noofrecord  = event.target.value;
    }
    changerecordid(event)
    {
      this.passrecordid = event.target.value;
      this.iftrue2 = true;
      this.checck = event.target.value;
    }
   /*  connectedCallback()
     { //  this.booleancheck();
      //console.log('this.bool connected '+this.bool);
       // this.classList.add("clasjjkkj");
      //  alert('connected callback parent');
    console.log('Outside connected callback parent');
        getallaccount({num:this.noofrecord}).then(resposnse=>{
            this.accounts = resposnse;
            this.record = resposnse;
            console.log(resposnse);
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
               console.log('this account connected'+this.accounts);
     }
   
      */
     connectedCallback()
     {
      console.log('how many time connected cal back fire ');
     } 
     handleClick()
    {
          console.log('how many time rendered call back ');
          const newDiv = document.createElement("lightning-button");
          newDiv.style.backgroundColor = "blue";
newDiv.style.color = "black";
newDiv.label = 'createdusing javascript';
newDiv.style.padding = "100px";
          const parent = this.template.querySelector("lightning-card");
          console.log('parent'+JSON.stringify(parent));
parent.appendChild(newDiv);
console.log('div tag get created');
    }
    handleClicke()
    {
      console.log('template query selector'+JSON.stringify(this.template.querySelectorAll('lightning-button')));
    }
    
 
    disconnectedCallback()
    {
        alert('disconnected call back')
    }
    errorCallback(error,stack)
    {
        console.log('reasom for error in parent')
    }
  renderedCallback()
  {
    console.log('how many time rendered call back fired in lifecycle hooks ');
  }
     booleancheck()
     {
      console.log('booleantesing');
      this.bool = true;
     }
     booleancheck2()
     {
      console.log('booleantesing');
      this.bool = false;
     }
   /* renderedCallback() {
        //  alert('rendered call back');
        console.log('this.bool = true'+this.bool);
        console.log('this record'+this.record);
        this.booleancheck2();
          console.log('how many time rendered call back');
          getallaccount({num:this.noofrecord}).then(resposnse=>{
            this.accounts = resposnse;
            console.log('this account rendered parent'+this.accounts);
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
               console.log('this.bool rendered'+this.bool);
    }
*/
  
   
}