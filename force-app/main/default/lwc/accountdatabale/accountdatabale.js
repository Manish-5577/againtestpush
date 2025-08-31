import { LightningElement,wire } from 'lwc';
import fetchaccount from '@salesforce/apex/accountdatatablecall.fetchaccount';

column = [{label: 'AccountName', fieldName : Name}
    ]
export default class Accountdatabale extends LightningElement {

accountdata
columns = column;
    connectedCallback() {
        //code
        fetchaccount.then((response)=>{

this.accountdata = response;
        }).catch((error)=>{
  console.log(error);
        })
    }

}