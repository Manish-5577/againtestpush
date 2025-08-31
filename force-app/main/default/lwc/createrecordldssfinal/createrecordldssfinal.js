import { LightningElement,api,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord , getRecord} from "lightning/uiRecordApi";
export default class Createrecordldssfinal extends LightningElement {
@track Name;
@track Phone;
 
    accountnamehandler(event)
    {
      this.Name =event.target.value;  
    }
    accountphonehandler(event)
    {
      this.Phone =event.target.value;
    }
    createaccount()
    {
      const fields = {'Name':this.Name,'Phone':this.Phone};
      const requiredinput = {apiName:'Account',fields};
      createRecord(requiredinput).then(resposne =>{ 
          alert('record has been succesfully created with id  '+resposne.id);
         // this.recordId = resposne.Id;
      }).catch(error=>{
        alert('error roccured due to this reason!!!!!!!!!!s'+error.body.message);
        console.log('error roccured due to this reason!!!!!!!!!!s'+JSON.stringify(error));
      })
    }








}