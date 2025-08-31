import { LightningElement,track,wire,api } from 'lwc';
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';
import {CurrentPageReference,NavigationMixin} from 'lightning/navigation'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class ApexcallingImperativeapproach extends NavigationMixin(LightningElement) {

@track noofrecord;
@track accounts;
abc = 9;

@wire(CurrentPageReference) cureentpagereferncee;

@api recordId
// @wire(getallaccount,{num :'$abc'})
// abc({data,error})
// {
//     console.log('wire approachh!!@@@')
// if(data)
// {   console.log('datat from woredd@@')
//     this.accountrecordds = data;
//    console.log(data);
// }
// else if(error)
// {console.log('erororor !!!')
//     console.log(error);
// }
// }
// constructor()
// {  super();
//     console.log('constructor check');
//     alert('this record idd==>>>'+this.recordId);
// }

connectedCallback()
{
    console.log('connectedcallback');
   // alert('this record idd==>>in connecyted callbackkkk imperative approach>'+this.recordId);
}

Noofrecordcount(event)
    {
  this.noofrecord = event.target.value;
    }
    getresponse(){
        if(this.accounts){
            return true;
        }
        return false;
    }
    getresult()
    { 
       console.log('this page refernceee !!!'+JSON.stringify(this.cureentpagereferncee));
        console.log('tettss2222@@@');
        getallaccount({num:this.noofrecord}).then(resposnse=>{
     this.accounts = resposnse;
     console.log('this account'+JSON.stringify(resposnse));
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
    handlenavigation(event)
    {

        alert('current page refeercen'+JSON.stringify(this.cureentpagereferncee))
        this[NavigationMixin.Navigate]({
            type: "standard__component",
            attributes: {
              componentName: "c__navigationallowedd",
            },
            state: {
              c__optionalState: "stateValue",
            },
          });
    }
}