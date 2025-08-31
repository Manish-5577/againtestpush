import { LightningElement,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord , getRecord} from "lightning/uiRecordApi";
import Account_OBJECT from '@salesforce/schema/Account';
import Name_F from '@salesforce/schema/Account.Name';
import Phone_f from '@salesforce/schema/Account.Phone';
export default class Createrecordldssfinal2ndapproach extends LightningElement {


@track  accountrecord = {
    Name: '',
    Phone : ''
}
handlechange(event)
{
    this.accountrecord[event.target.name] = event.target.value;
    console.log('event.target.name==>'+event.target.name);
   // alert('testt45566'+json.stringify(this.accountrecord));
}
createaccount()
{  

    const fields = {};
    fields[Name_F.fieldApiName] = this.accountrecord.Name;
    console.log('this.accountrecord.Name==>'+this.accountrecord.Name);
    fields[Phone_f.fieldApiName] = this.accountrecord.Phone;
    console.log('this.accountrecord.Phone==>'+this.accountrecord.Phone);
    const accounttree = { apiName: Account_OBJECT.objectApiName, fields };
    createRecord(accounttree).then(resposne =>{ 
        console.log('success');
        alert('record has been succesfully created with id  '+resposne.id);
       // this.recordId = resposne.Id;
    }).catch(error=>{
     // alert('error roccured due to this reason!!!!!!!!!!s'+error.body.message);
      console.log('error roccured due to this reason!!!!!!!!!!s'+JSON.stringify(error));
    })
}

}