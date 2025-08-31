import { LightningElement,track,api,wire } from 'lwc';
import getoppquotepricerecords from '@salesforce/apex/databasequery.getoppquotepricerecords'
// import getpricebookid from '@salesforce/apex/databasequery.getpricebookid';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class CustomopportunityProduct extends LightningElement {

  @api recordId;
  @api objectApiName;
  query = '';
  @track record = [];
  showmodal = false;
  pricebookrecordid = ''
  @track fields = ["Name","ProductCode","Family"];
  displayfields ='Name,ProductCode,ProductFamily';
  connectedCallback()
  {
    console.log(this.objectApiName+'tesiintnt');
  //  this.query = `SELECT ID,Pricebook2Id from '${this.objectApiName}  where id = '${this.recordId}' `;
     if(this.objectApiName === 'Opportunity')
      {
          this.query = ` SELECT Id, OpportunityId, SortOrder,	
           PricebookEntryId, Product2Id,Product2.Name, ProductCode, Name, Quantity, Discount,
            UnitPrice, ServiceDate, Description FROM OpportunityLineItem
            where OpportunityId = '${this.recordId}'
          `
      }
      else{

        console.log('erroororor'+this.query+'nothing');
      }
       
  }

// @wire(getpricebookid,{query :'$query'})
// pricebookdata({data,error})
// {     
//   if(data)
//     {   console.log('prce book data');
//      console.log(data);
//     }
//     else if(error)
//       {

//       }
// }


    @wire(getoppquotepricerecords ,{query : '$query'})
    dataresult({data,error})
    {
      if(data)
        {console.log(data)
          this.record = JSON.parse(JSON.stringify(data));
          console.log('whhat comig from wire service');
           console.log(JSON.stringify(this.record))
        }
        else if(error)
          {
            console.log(error);
          }
          this.addrow();
    }

    addrow()
    {
       this.record.push(
        {
            Quantity : null,
            Description : '',
            UnitPrice : null,
            ServiceDate  : null
        }
       )
    }
    handleremove(event)
    {
        let indexx = event.currentTarget.dataset.index;
        let recordId = event.currentTarget.dataset.recordId;
        console.log('indexx to delete$$$$'+indexx);
        if(recordId){
        deleteRecord(recordId).then(()=>{
          this.record.splice(indexx,1);
        }).catch((error)=>{

        })
      }
      else {
        this.record.splice(indexx,1);
      }
    }
    navigatetodetailpage(event)
    {
              event.preventDefault();
              let recordId = event.currentTarget.dataset.recordId;
              let recordurl = 'https://'+location.host + '/lightning/r/OpportunityLineItem/'+ recordId +'/view';
              location.href = recordurl;
              //Note : we can use navigation approach as well but this is different approach.
    }
    handleslectedrecord(event)
    {
          console.log('lets this event');
          console.log(JSON.stringify(event.detail));
    }

    handlechangee(event)
    {
          const index = event.currentTarget.dataset.index;
          const value = event.currentTarget.value;
          const name = event.currentTarget.name;
          console.log(name);
          console.log(value);
          console.log(index);

          this.record[index][name] = value;
    }
}