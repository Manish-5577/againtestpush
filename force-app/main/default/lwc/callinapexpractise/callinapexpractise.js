import { LightningElement,track } from 'lwc';
import getallaccount2 from '@salesforce/apex/allaccount2.getallaccount2'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

const columns = [
    {label:'Name',fieldName : 'namess', type: 'text'},
    {label:'Phone',fieldName : 'phoness', type: 'text'},
    {label:'Id',fieldName : 'Id'}
]
export default class Callinapexpractise extends LightningElement {

@track fetchcount;
@track datas;
@track columlist = columns;
handlechanage(event)
{
    this.fetchcount = event.target.value;
}
fetchdatacount(){
    getallaccount2({num:this.fetchcount}).then((response)=>{
       console.log('testing Phase +++>');
        console.log(typeof response);
//      const resultt= JSON.parse(response);
let parseddata = JSON.parse(JSON.stringify(response));
parseddata.forEach((result)=>{
            console.log('iteration==>');
            console.log( result.Name);
            console.log( result.Phone);
            result.namess = result.Name;
            result.phoness = result.Phone;
            result.Id = result.Id;
        })
      //  console.log('where is data');
         this.datas = parseddata;
      //  console.log(response);
    }).catch(error=>{
        console.log(error);
    })
}

}