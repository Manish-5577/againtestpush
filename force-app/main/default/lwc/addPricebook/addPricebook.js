import { LightningElement,track,api } from 'lwc';
import updatepricebokid  from '@salesforce/apex/databasequery.updatepricebokid'
export default class AddPricebook extends LightningElement {

 @track fields = ["Id","Name"];
 @api parentobjectApiName ;
 @api parentId;
 pricebookId;
  errormssg ;

 handlesave()
 {  
    if(this.pricebookId)
    {
      //console.log('kaha hai tu ')
  this.errormssg = undefined;
    }
    else{
     // console.log('yaha hu mai');
      this.errormssg = `Hi user need to select the pricebook for current object '${this.parentobjectApiName}`;
    }

  updatepricebokid({objectname:this.parentobjectApiName,recordid :this.parentId,pricerecordid: this.pricebookId}).then((data)=>{
   // console.log('record updated succesfully!!!!!!!!!!!!!!')
    if(this.pricebookId)
    {  const sentpriceid = new CustomEvent('recivepriced',{detail :{priceid : this.pricebookId}});
      this.dispatchEvent(sentpriceid);
    //  console.log('is it reached hereee');
    }
    else {
      //console.log('testingg');
    }
  }).catch(()=>{
    //console.log('failed to update');
  })
 }
handleslectedrecord(event)
{  //console.log('on select  event  =>');
 // console.log(JSON.stringify(event.detail.recordId));
  this.pricebookId = event.detail.recordId;
 // console.log(this.pricebookId);
}
cancelmodal(event)
{  //console.log('handleccancel33333');
  
  this.dispatchEvent(new CustomEvent("modaloff"));
 
}
handlecancel(event)
{   //console.log('handleccancel foredd');
  
  this.dispatchEvent(new CustomEvent("modaloff22"));
}
connectedCallback()
{
  //console.log('parent objectapi name'+this.parentobjectApiName);
  //console.log('parent record IDDD name'+this.parentId);

}
handlechangee(event)
{
 // console.log('@@@@@@@@@@@@@@@@@@@'+event.target.data)
}
}