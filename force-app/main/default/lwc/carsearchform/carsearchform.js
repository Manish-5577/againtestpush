import { LightningElement,api,track,wire } from 'lwc';

import getCartype from '@salesforce/apex/cartype.getCartype';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class Carsearchform extends NavigationMixin(LightningElement) {
@track carTypes;
@track selectedValue;
@track record;
@track error;
@wire(getCartype)
wiredrecord({data,error}){
    if(data){
        console.log('datais ',data.length);
        this.carTypes = [{label:'All Types',value:' '}];
         
           console.log('data data data',typeof(data));
    //   for(const key in data){
    //     console.log(data[key]);
    //   }
        data.forEach(element => {
            console.log('element value isissii',element.Name+ element.Id);
           // console.log('elementis%%%% '+JSON.stringify(element.Name));
           // console.log('elementis****** '+Object.values(element.Name));
           const cartype = {};
         //  cartype.label = JSON.stringify(element.Name);
          // cartype.value =  JSON.stringify(element.Id);
           cartype.label = element.Name;
         cartype.value =  element.Id;
           console.log('element new name',cartype.label);
           console.log('element new value',cartype.value);
            this.carTypes.push(cartype);
       console.log('car types is ',this.carTypes);
    
        });
    }
    else if(error)
    {console.log('erroror');
   this.showToast('Error',error.body.message,'error')
    }

}


createNewCarType(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Car_Type__c',
            actionName :'new'
        }
    })
}

handlecartypesChange(event){
    

const cartypeId  =  event.target.value;
console.log('tetsts',cartypeId);

const cartypeselectionchange = new CustomEvent('cartypeselect',{detail:cartypeId});
this.dispatchEvent(cartypeselectionchange);

}
showToast(title,message,variant) {
    const event = new ShowToastEvent({
        title: title,
        message:message
           ,
           variant : variant,
    });
    this.dispatchEvent(event);

}

}