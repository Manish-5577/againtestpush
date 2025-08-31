import { LightningElement,track,api,wire} from 'lwc';
import {getRecord ,getFieldValue }  from 'lightning/uiRecordApi';
//import userprofiles from '@salesforce/schema/Contact.Account.Owner.Username';
import owneridd from '@salesforce/schema/Contact.OwnerId';
import idd from '@salesforce/schema/Contact.Id';
import acctid from '@salesforce/schema/Contact.accountId';
export default class Custompagesetup extends LightningElement {

@api recordId
 @api test
 @track objectt = {

    name1 : '',
    name2 : '',
    name3 : '',
    name4 : ''
}

 @wire(getRecord, { recordId: "$recordId", fields: [idd,acctid,owneridd] })
  record({data, error})
  {
    if(data)
    {  console.log('is it rrrr')
      console.log(data)
    }
    else{
        console.log('errror ooopp occureeedede!!!')
      console.log(error)
    }
  }

 
  renderedCallback() {
    console.log('lalalll this record')
    console.log(this.record.data);
  }
  connectedCallback() {
    console.log('wire service data');
     console.log('this .record ==>'+JSON.stringify(this.record))
  }

  


handlechange(event)
{   event.preventDefault();
      this.objectt[event.target.name] = event.target.value;
}

handleClick()
{   console.log('handle submittt@@');
    console.log(JSON.stringify(this.objectt));
    console.log('handle submittt222');
}


}