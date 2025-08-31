import { LightningElement,api,track,wire } from 'lwc';
import { createRecord , getRecord} from "lightning/uiRecordApi";

export default class Ldscreaterecord extends LightningElement {

 
    @track accountname;
    @track accountphone;
  @track accounturl ;
 
  @api recordId;
  
  @wire(getRecord, {recordId:'$recordId',fields: ['Account.Name','Account.Phone','Account.Website']})
  accountRecord;
     
  get accountnames()
            {   
                      if(this.accountRecord)
                      {
                        return true;
                      }
                      return false;
            }

    accountnamehandler(event)
    {
        this.accountname = event.target.value;
        console.log(this.accountname);
    }
    accountphonehandler(event)
    {
        this.accountphone = event.target.value;
        console.log(this.accountphone);
    }
    accounturlhandler(event)
    {
        this.accounturl = event.target.value;
    }
   
    createaccount(){ 
        const fields = {'Name':this.accountname,'Phone':this.accountphone,'Website':this.accounturl};
        const requiredinput = {apiName:'account',fields};
        createRecord(requiredinput).then(resposne =>{ 
            console.log('record has been succesfully created with id  ',resposne.id);
            this.recordId = resposne.Id;
        }).catch(error=>{
           // console.error('error roccured due to this reason!!!!!!!!!!s', error.body.message);
        })
    }
  }