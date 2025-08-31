import { LightningElement,track,api,wire } from 'lwc';
import getoppquotepricerecords from '@salesforce/apex/databasequery.getoppquotepricerecords'
 import getpricebookid from '@salesforce/apex/databasequery.getpricebookid';
 import pricebookenrty from '@salesforce/apex/databasequery.pricebookenrty';
import { deleteRecord } from 'lightning/uiRecordApi';
import submitproduct from   '@salesforce/apex/databasequery.submitproduct';
import lightningmodalextension from 'c/lightningmodalextension'
export default class CustomopportunityProduct extends LightningElement {

  lookuptext;
  @api recordId;
  @api objectApiName;
  query = '';
  query2 =''
  @track record = [];
  showmodal = false;
  pricebookrecordid ='';
  showpricebook = false;
  indexformodal ;
  pricebookmap = {}
  @track fields = ["Name","ProductCode","Family"];
  displayfields ='Name,ProductCode,ProductFamily';
errormssg ;
  objectapimap ={
    'Opportunity' : 'OpportunityId',
    'Order' : 'OrderId',
    'Quote': 'QuoteId'
  }
  connectedCallback()
  {
   // console.log(this.objectApiName+'tesiintnt');
    this.query2 = `SELECT ID,Pricebook2Id from ${this.objectApiName} where id = '${this.recordId}' `;
  //  console.log('this query22'+this.query2);
     if(this.objectApiName === 'Opportunity')
      {
          this.query = ` SELECT Id, OpportunityId, SortOrder,	
           PricebookEntryId, Product2Id,Product2.Name, ProductCode, Name, Quantity, Discount,
            UnitPrice, ServiceDate, Description FROM OpportunityLineItem
            where OpportunityId = '${this.recordId}'
          `
      }
      else{

        //console.log('erroororor'+this.query+'nothing');
      }
       
  }

@wire(pricebookenrty,{priceBook2Idd:'$pricebookrecordid'})
pricebookentryrecord({data,error})
{
  if(data)
  {   console.log('element$$$');
       data.forEach(element => {
        console.log('element.Id'+element.Id);
        this.pricebookmap[element.Product2Id] = element.Id;
        console.log('element.Id'+element.Id);
       });
  }
  if(error)
  {

  }
}


@wire(getpricebookid,{query :'$query2'})
pricebookdata({data,error})
{     
  if(data)
    {  
    //    console.log('prce book data@@@@@');
    //  console.log(data);
        if(data[0].Pricebook2Id &&  data[0].Pricebook2Id != '' )
          {
            this.showmodal = false;
            console.log('reachedd heree@%%%%');
            this.pricebookrecordid = data[0].Pricebook2Id;
            console.log('reachedd heree@@');
          }
          else{
           // console.log('is it enteredede!!!')
            this.showmodal = true
          }
    }
    else if(error)
      { 
       //  console.log('what ius the iseue');
            console.log(error);
      }
}


    @wire(getoppquotepricerecords ,{query : '$query'})
    dataresult({data,error})
    {
      if(data)
        {
          // console.log(data)
          this.record = JSON.parse(JSON.stringify(data));
          // console.log('whhat comig%%%%%%%&& from wire service');
          //  console.log(JSON.stringify(this.record))
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
        // console.log('indexx to delete$$$$'+indexx);
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
          const index = event.currentTarget.dataset.index;
          const name = event.currentTarget.dataset.name;
          console.log(index);

          console.log('is it??'+JSON.stringify(event.detail));
          this.record[index].Product2Id = event.detail.recordId;
        
    }

    handlechangee(event)
    {
          const index = event.currentTarget.dataset.index;
          const value = event.currentTarget.value;
          const name = event.currentTarget.name;
          console.log('lookup name'+name);
          console.log('lookup value'+value);
          // console.log(index);

          this.record[index][name] = value;
    }

    handlerecivepriceid(event)
    {
        if(event.detail.priceid != '')
        {
          this.showmodal = false;
          this.pricebookrecordid = event.detail.priceid;
        }
    }
    handleClick(){
       this.showmodal = true;
    }
    modallof()
    {  
      this.showmodal =false
      this.showpricebook = true;
    }
    modalloff()
    {
      this.showmodal =false;
      this.showpricebook = true;
    }

    handleproductupdate()
    { 
      let validd = this.checkvalidation();
      this.record.forEach((element)=>{
             if(!element.Id && !element.Product2Id){
              validd = false;
              this.errormssg = 'Product is required in order to save ';
              console.log('why mssg still coming');
             }
      })
      if(!validd)
      {  
         return;
      }
            this.record.forEach((element)=>{
                let jj = 'PricebookEntryId';
   element[jj] = this.pricebookmap[element.Product2Id];
                   let parentapiname = this.objectapimap[this.objectApiName];
                   element[parentapiname] = this.recordId;
            })
            submitproduct({objectApiName : this.objectApiName,
              recordtoupsert : (JSON.stringify(this.record))}).then(()=>{
                 console.log('is it upserted!!!!!!!!!1');
                 this.errormssg =undefined;
                 //Note : onupsert operation we need to refresh page or call 
                 //auranebled method to fetch all record updated record and push into this.record 
                 
            }).catch((error)=>{
             console.log(error);
            })

    }

    checkvalidation()
    {
      const allValid = [
        ...this.template.querySelectorAll('lightning-input'),
    ].reduce((validSoFar, inputCmp) => {
        console.log('default valur of valid so far'+validSoFar);
        inputCmp.reportValidity();
        return validSoFar && inputCmp.checkValidity();
    }, true);

    return allValid;
    }

    handlemodalchange(event)
    {
      let index = event.currentTarget.dataset.index;
      let value = event.currentTarget.value
     // this.lookuptext = value;
      this.record[index]['lookuptext'] = value;
      console.log('valallla'+value+'indexxx'+ index)
      //this.modalopen()
    }
   async  openmodalextendedone(event)
    {
      let indexx = event.currentTarget.dataset.index;
     let value = event.currentTarget.dataset.value;
      console.log('index==>'+indexx+'valueueue==>'+ value );
   const result = await lightningmodalextension.open({
    size :'large',
    Description : 'Searh product modal',
    label : 'search product',
    pricebookId :this.pricebookrecordid,
    content :value,
    index : indexx
   })
   console.log(result);
    }
}