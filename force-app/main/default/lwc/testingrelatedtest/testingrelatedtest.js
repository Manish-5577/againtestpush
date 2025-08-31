import { LightningElement,track,wire } from 'lwc';
import  getaccount from '@salesforce/apex/testingstatuscode.getaccount'
import { getRelatedListRecordsBatch } from "lightning/uiRelatedListApi";

export default class Testingrelatedtest extends LightningElement {

bool = false;
 @track accdata;
 @track recordidd='';
 @track results
 error
 @track list = [];
   @track Values;
   @track contactss = [];
   @track oportunity = [];
    @track  mapconaccn = new Map();
@wire(getRelatedListRecordsBatch, {
    parentRecordId: '$recordidd',
    relatedListParameters: [
      {
        relatedListId: "Contacts",
        fields: ["Contact.Name", "Contact.Id"],
        sortBy: ["Contact.Name"],
      },
      {
        relatedListId: "Opportunities",
        fields: ["Opportunity.Name", "Opportunity.Amount"],
        sortBy: ["Opportunity.Amount"],
      },
    ],
  })
  listInfo({ error, data }) {
    if (data) {
        console.log(data)
      this.results = data.results;
      this.error = undefined;
    } else if (error) {
        console.log(error);
      this.error = error;
      this.results = undefined;
    }
  }

   connectedCallback() {
              getaccount().then((response)=>{
                   this.accdata = JSON.parse(JSON.stringify(response));
              }).catch((error)=>{
                console.log('ooops some thing went wrong');
                console.log(error);
              })  
   }

   handleClick()
   {
   this.bool = true;
   }
   handlecontact(event)
   {
   console.log(event.currentTarget.dataset.index);
   this.recordidd = this.accdata[event.currentTarget.dataset.index].Id;
   console.log(this.accdata[event.currentTarget.dataset.index].Id);
   }

     handleinputcheck(event)
     {
         if(event.detail.checked)
         { 
          this.list.push(this.accdata[event.currentTarget.dataset.index]);
             this.mapconaccn.put(this.accdata[event.currentTarget.dataset.index].Id, JSON.parse(JSON.stringify(this.accdata.Contacts)));
        //  console.log('onee');
        // let  listt = [];
        //  if(this.accdata[event.currentTarget.dataset.index].Contacts != undefined)
        //  {
        //    listt = [...this.accdata[event.currentTarget.dataset.index].Contacts];
        //  }
        //   if(listt.length === 0){
        //       //  this.mapconaccn.set(this.accdata[event.currentTarget.dataset.index].Id,listt)
        //   }else{
        //     console.log('hureee')
        //      mapconaccn.set(this.accdata[event.currentTarget.dataset.index].Id,listt)
        //   }
         }
         else{
         let indexval =  this.list.indexOf(this.accdata[event.currentTarget.dataset.index]);
           this.mapconaccn.delete(this.accdata[event.currentTarget.dataset.index].Id)
          this.list.splice(indexval,1);
          console.log('lalla');
         }
      
     }

}