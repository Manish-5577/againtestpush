import { LightningElement,wire } from 'lwc';
import  fetchcontactopportunity from '@salesforce/apex/wrapperclasseg.fetchcontactopportunity'
export default class Wrapperdemo extends LightningElement {


    @wire (fetchcontactopportunity,{})
    abc({data,error})
    {
         if(data)
         {
            data.forEach(element => {
                console.log(JSON.stringify(element));
            });
         }
         if(error)
         {  console.log('error');
            console.log(error);
         }
    }
  
}