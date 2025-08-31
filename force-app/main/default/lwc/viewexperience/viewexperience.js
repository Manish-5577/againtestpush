import { LightningElement,api,track } from 'lwc';
import  getexperince from '@salesforce/apex/viewexperince.getexperince';
import {NavigationMixin} from 'lightning/navigation';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class Viewexperience extends NavigationMixin(LightningElement)  {

 // @api cardid;
 privatecardid;

 @api 
 get cardid(){
    return this.privatecardid;
 }
 set cardid(value){
    this.privatecardid = value;
    this.getexperince();
 }
@track carexperienceresponse = [];
    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title: title,
            message:message
               ,
               variant : variant,
        });
        this.dispatchEvent(event);
    
    } 
  //  data-userid

    userClickHandler(event){
const userid = event.target.getAttribute('data-userid');
this[NavigationMixin.Navigate]({

    type :"standard__recordPage",
    attributes : {
        recordId: userid,
        objectApiName :"user",
        actionName :"view",
    }
})

    }
    connectedCallback(){
  this.getexperince();
  // this method will call only once when lwc loads but when u try to open different car/tile this will not work 
//   my requirement is when i click on any car i want my getexperince() to call dynamically so i will use get and setter
    }

  @api  getexperince(){
        console.log('this cardid is ',this.cardid);
        getexperince({cardid:this.cardid}).then((result)=>{
            console.log('car experience result is',result);
this.carexperienceresponse = result;
        }).catch((error)=>{
            this.showToast('error',error.body.message,'Error');
        })
    }
get hasExperiences(){
       if(this.carexperienceresponse.length >0){
        return true;
       }
       return false;
}

}