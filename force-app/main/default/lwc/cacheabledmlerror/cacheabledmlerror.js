import { LightningElement,wire } from 'lwc';
import getallaccount2 from '@salesforce/apex/allaccount2.getallaccount2'
export default class Cacheabledmlerror extends LightningElement {

handleClick()
{
    getallaccount2({num : 10}).then((data)=>{
  console.log('sucess ###3@@@@@888'+JSON.stringify(data));
    }).catch((error)=>{
        console.log('error@@@ neooo!!!!!!!!!'+JSON.stringify(error));
    })
}
}