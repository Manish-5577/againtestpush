import { LightningElement,wire,track } from 'lwc';
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

const columns = [
    {label:'Name',fieldName : 'Name', type: 'text'},
    {label:'Phone',fieldName : 'Phone', type: 'text'},
    {label:'Id',fieldName : 'Id'}
]
export default class Apexcalling_Wireapproach extends LightningElement {
colmnlist = columns
@track fetchcount = 7;
@track datas;
    handlechanage(event)
    {
        this.fetchcount = event.target.value;
    }
                   
@wire(getallaccount)
accountdata({data,error})
{
    console.log('kya ho raha hai');
    if(data){
        this.datas = data;
  alert('data value ==>'+JSON.stringify(data));
    }
    else if(error)
    {
    alert('data value ==>'+JSON.stringify(error));
    }
}
    


}