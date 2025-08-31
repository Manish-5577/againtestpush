import { LightningElement,track,wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord , getRecord, getFieldValue,getFieldDisplayValue} from "lightning/uiRecordApi";
import 	Amount from "@salesforce/schema/Opportunity.Amount";
import CreatedDate from "@salesforce/schema/Opportunity.CreatedDate";
const fields = [Amount, CreatedDate];
export default class Createrecordldsfinalapproach3 extends LightningElement {

    abc 
    recordidd ="0065j00001ceLdWAAU";
@track accountrecord={
    'Name': 'iuyqiwuyqwie',
    'Phone':'',
    'securitycheck__c': ''
}
handlechange(event)
{
       this.accountrecord[event.target.name] = event.target.value;
}
createaccount()
{   console.log('this.accountrecord.Name'+this.accountrecord.Name+'this.accountrecord.Phone'+this.accountrecord.Phone)
    const fields = {'Name':this.accountrecord.Name,'Phone':this.accountrecord.Phone,'securitycheck__c':this.accountrecord.securitycheck__c};
    alert('fields is==>'+JSON.stringify(fields));
   const  acconbhejo = {apiName:'Account',fields};
    alert('testt');
    createRecord(acconbhejo).then(resposne =>{ 
        console.log('success');
        alert('record has been succesfully created with id  '+resposne.id);
       // this.recordId = resposne.Id;
    }).catch(error=>{
     // alert('error roccured due to this reason!!!!!!!!!!s'+error.body.message);
      console.log('error roccured due to this reason!!!!!!!!!!s'+JSON.stringify(error));
      console.log(error);
    })

}

@wire(getRecord, { recordId: '$recordidd', fields })
oppportunity;

get amounteee()
{   console.log('rteurned value'+JSON.stringify(this.oppportunity));
   // console.log(this.oppportunity.data.Fields);
    return 'abc'
  //  return this.oppportunity.data.fields.Amount.value;
   // this.accountRecord.fields.Type.value;
}


get amount() {
    console.log('llllll get check')
    console.log(this.oppportunity);
 const  dd = getFieldValue(this.oppportunity.data, Amount);
 console.log('dd=>'+dd);
 return dd;
}
get createddate()
{
    const nn =getFieldValue(this.oppportunity.data, CreatedDate);
     console.log('nn==>'+nn);
     return nn;
     
}

get amount22() {
    const  dd = getFieldDisplayValue(this.oppportunity.data, Amount);
    console.log('dd=>'+dd);
    return dd;
   }
   get createddate22()
   {
       const nn =getFieldDisplayValue(this.oppportunity.data, CreatedDate);
        console.log('nn==>'+nn);
        return nn;
       
   }

}