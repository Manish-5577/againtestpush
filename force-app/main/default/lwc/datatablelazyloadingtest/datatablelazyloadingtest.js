import { LightningElement,track } from 'lwc';
import lazyloading from '@salesforce/apex/auraenabledmethod.lazyloading'
const columnn = [
     { label: 'AccountId', fieldName: 'Id', type: 'text' },
    {label: 'Name', fieldName: 'Name', type: 'text' }
]
export default class Datatablelazyloadingtest extends LightningElement {

@track accdata
 limit = 49;
 offset = 0;
 columnslist  = columnn;
connectedCallback() {
   lazyloading({limitsss : this.limit, offsett : this.offset}).then((response)=>{
      let rr = JSON.parse(JSON.stringify(response));
     rr.forEach(currentItem => {
           currentItem.AccountId = currentItem.Id;
                currentItem.Name = currentItem.Name;
     });
     this.accdata = rr;
     console.log('sucess@@@@@!!!!!!!!');
     console.log(response);
   }).catch((error)=>{
    console.log('reached in error block ');
    console.log(error);
   })
}
handleonload()
{  
    let cuurentrec = this.accdata[(this.accdata).length -1];
    console.log(cuurentrec);
    console.log(cuurentrec.Id + 'name ::::>' + cuurentrec.Name )
}
}