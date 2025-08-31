import { LightningElement } from 'lwc';
import saveaddress from  '@salesforce/apex/Beercontroller.saveaddress'
export default class Beeraddresscomp extends LightningElement {

address = {

    City__c : '',
    Country__c :'',
    Postal_Code__c : '',
    State__c : '',
    Street__c : ''
}
handleaddresschange(event)
{  
     this.address[event.target.name] = event.target.value;
    
}
handleClick()
{   console.log('address save!!!')
     let addresstosave = JSON.stringify(this.address);
  saveaddress({adressdata:addresstosave}).then(()=>{
             console.log('success!!!!address saved ');
     //        this.dispatchEvent(new CustomEvent('navigateshowaddresscomp',{}));
              this.dispatchEvent(new CustomEvent("navigateshowaddresscomp"));
  }).catch((error)=>{
             console.log('error while saving address');
             console.log(error);
  })
}
}