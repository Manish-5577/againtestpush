import { LightningElement,track } from 'lwc';
import fetchaccountdetails from '@salesforce/apex/accountopportunitycase.fetchaccountdetails'
import fetchaccrelatedrecord from '@salesforce/apex/accountopportunitycase.fetchaccrelatedrecord';

const column = [
          { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'url' },

]
const columncase = [
          { label: 'Id', fieldName: 'Id' },
    { label: 'CaseNumber', fieldName: 'CaseNumber', type: 'text' },

]
const columnopportunity = [
          { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'text' },

]
export default class Accountrelatedcaes extends LightningElement {

colmbb = column;
columncase = columncase;
columnopp = columnopportunity;
accdata;
@track relatedcase =[];
@track relatedopp = [];
async connectedCallback() {
           let data = await fetchaccountdetails();
            this.accdata = data;
  }
async handleClick()
{
let hh =  this.template.querySelector("lightning-datatable").getSelectedRows();
let accids = [];
   hh.forEach(currentItem => {
     accids.push(currentItem.Id);
   });
   console.log('is it coming')
      let jj = await fetchaccrelatedrecord({acctid :accids});
      //this.relateddata = jj;
      console.log('lalaalal');
    jj.forEach(currentItem => {
        //TODO : currentItem
        console.log('current item ');
        console.log(currentItem);
        this.relatedcase = [...this.relatedcase, ...currentItem.cc];
        this.relatedopp  = [...this.relatedopp, ...currentItem.opp];
    });
    console.log('kskks');
      console.log(this.relatedcase.length);
      console.log(this.relatedopp.length);
}
  handleRowAction()
  {
    
  }
}