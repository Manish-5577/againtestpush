import { LightningElement,wire,api } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import getAccounts223 from '@salesforce/apex/AccountController.getAccounts223';
import updaterelatedcontact from '@salesforce/apex/AccountController.updaterelatedcontact'
import deleteAccount from '@salesforce/apex/AccountController.deleteAccount';
import { RefreshEvent } from 'lightning/refresh';
import updateAccount from '@salesforce/apex/AccountController.updateAccount';
import NAME_FIELD from "@salesforce/schema/Account.Name";
import OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import { notifyRecordUpdateAvailable,getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Refreshapexdemo extends LightningElement {
    accounts;
    accounts2;
    error;
    wiredAccountResult;
    wiredAccountResult22;
    recordiid;
    @api recordId;
  // connectedCallback()
  // { console.log('connected 1 time');
  //     getAccounts({}).then((data)=>{
  //         console.log('connected call back');
  //           console.log(data);
  //     }).catch((error)=>{
  //             console.log('connected cal back error');
  //            console.log(error)
  //     });

  // }
 
  @wire(getRecord, {
    recordId: "$recordiid",
    fields: [NAME_FIELD, INDUSTRY_FIELD],
    optionalFields: [PHONE_FIELD, OWNER_NAME_FIELD],
  })
  accountgetrec;
  @wire(getRecord, {
    recordId: "$recordiid",
    fields: [NAME_FIELD, INDUSTRY_FIELD],
    optionalFields: [PHONE_FIELD, OWNER_NAME_FIELD],
  })
  accountgetrec22;

  get name1() {
    return getFieldValue(this.accountgetrec.data, NAME_FIELD);
  }
  get name2() {
    return getFieldValue(this.accountgetrec22.data, NAME_FIELD);
  }

    @wire(getAccounts223)
wiredAccounts( result ){
this.wiredAccountResult=result;
console.log('wired outer ');
if(result.data){
  //  console.log('data from refresh apex ')
  console.log('wire called')
this.accounts = result.data;
this.error = undefined;
}
else if(result.error)
{  console.log('lalal');
    console.log(result.error);
  //  console.log('error in refresh apex ')

this.accounts = undefined;
this.error = result.error;
}
}

//

@wire(getAccounts)
wiredAccounts33( result ){
this.wiredAccountResult22=result;
console.log('wired outer ');
if(result.data){
  //  console.log('data from refresh apex ')
  console.log('wire called')
this.accounts2 = result.data;
this.error = undefined;
}
else if(result.error)
{  console.log('lalal');
    console.log(result.error);
  //  console.log('error in refresh apex ')

this.accounts2 = undefined;
this.error = result.error;
}
}


async handleDelete(event){
    console.log('testing7888888888888')
        const accountId= event.target.dataset.accountId;
        this.recordiid = accountId;
        updateAccount({ accountId })
            .then(() =>{
// Perform any success actions if needed
console.log('llaafterrefreshhhhhh@!!!')
refreshApex(this.wiredAccountResult22);
this.dispatchEvent(new RefreshEvent());
        const event = new ShowToastEvent({
            title: 'Deleted Successfully',
            message:
                'Deleted account record suucessfully !!!!!!!!!!!!!!!!!!!!!!!!!!',
        });
        this.dispatchEvent(event);
        // notifyRecordUpdateAvailable([{recordId: accountId}]).then(()=>{
        //   console.log('testing notify record update available');
        //  }).catch((error)=>{
        //   console.log('error handlingg##$$');
        //   console.log(error);
        //  });
})
            .catch((error) =>{
              
            console.log('error44a');
            console.log(JSON.stringify(error));
          //      console.log(error);
// Handle the error if deletion fails
});
}
async handleClick()
{
  console.log('this recordid'+ this.recordId);
  await updaterelatedcontact({accountid :this.recordId});
 
  
}
}