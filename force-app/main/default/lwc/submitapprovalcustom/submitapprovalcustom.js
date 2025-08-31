import { LightningElement,api,track } from 'lwc';
import getaccount from '@salesforce/apex/fetchaccountrecord.getaccount';
import submititforaprovall from '@salesforce/apex/Submitaccountapproval.submititforaprovall';
import submititforaprovall2 from '@salesforce/apex/Submitaccountapproval.submititforaprovall2';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Submitapprovalcustom extends LightningElement {

    @api recordId;
 @track  accountrecord;
@track customcheck= true;
@api recordidofselectedrecord;
    connectedCallback(){
        console.log('jgjgjjhgjhg');
        this.callaccountrecord();
    }

    submititforapproval(){
        console.log('let check it ');
        submititforaprovall({id:this.recordId}).then((response=>{
                   alert('entered into this step');
        })).catch();
    }   
    callaccountrecord(){
        console.log('hdhdhdhdhd');
        console.log('this recordid is ==>',this.recordId);
        getaccount({id:this.recordId}).then((response=>{
            this.accountrecord = response;
                console.log('response ===>',response);
          console.log()
                if(response.Rating == 'Hot' && response.Industry == 'Banking' ){
                           this.customcheck = false;

                }
                else if(response.rating = 'cold'){
                    this.submititforapproval();
                }

        })
           
        ).catch((error=>{
            console.log('error reason is ==>',error.body.message);
        }));
    }
    handleselectedrecordidd(event){
     this.recordidofselectedrecord = event.detail;
     console.log('this time id is s==>',this.recordidofselectedrecord);
    }

    handleClick(){
        submititforaprovall2({approverid: this.recordidofselectedrecord,recordid:this.recordId}).then((response=>{
            alert('record submitted for approval');
        })).catch((error=>{
            console.log('reason is !!!!!!!!',error.body.message);
        }))
       // this.customcheck  =true;
     //  eval("$A.get('e.force:refreshView').fire();");
     alert('record submitted for approval');
     window.location.reload();
    }
}