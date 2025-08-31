import { LightningElement,api,wire,track } from 'lwc';
import getcarlist from '@salesforce/apex/carmodel.getcarlist';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class Carsearchresult extends LightningElement {

@api carTypeId ;
@track cars;
@track selectedacaridtocartile;
    @wire(getcarlist, {cartypeId:'$carTypeId'})//dollar symbol used to make variable dynamic 
    wirecarlist({data,error}){
         if(data)
         {
            this.cars = data;
            
            console.log('data of car isss ',data);
            console.log(data);
         }
         else if(error){
          
                       this.showToast('error',error.body.message,'Error')
         }
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

    get carsfound(){
        if(this.cars){
            console.log('77777');
            return true;
        }
        //console.log('7666666');
        return false;
    }

    getslecetdcarid(event){
       
        const selectedid = event.detail;
        console.log('selectedid99990',selectedid);
        this.selectedacaridtocartile = selectedid;
    }

    renderedCallback()
    {
        console.log('car type change rendered call back triggered');
    }
}