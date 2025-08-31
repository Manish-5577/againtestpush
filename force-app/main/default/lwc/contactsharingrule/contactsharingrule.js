import { LightningElement,wire } from 'lwc';
import contactlistsize  from '@salesforce/apex/withsharingpractise.contactlistsize';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Contactsharingrule extends LightningElement {

    @wire(contactlistsize)
    wirerecord12({data,error}){
        console.log('tetststtss999999');
          if(data){
            console.log('rating data',data);
            alert('data count'+data);
          }
          else if(error){
            alert('data count'+data);
            console.log('error reason is '+error.body.message);
          }
           

    }
}