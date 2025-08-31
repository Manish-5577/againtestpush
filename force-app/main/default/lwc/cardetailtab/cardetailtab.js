import { LightningElement,api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
export default class Cardetailtab extends NavigationMixin(LightningElement) {



    @api car;
    fulldetail(){

        this[NavigationMixin.Navigate]({

        type:"standard__recordPage",
        attributes:{

            recordId : this.car.data.fields.Id.value,
            objectApiName : "Car__c",
            actionName : "view",
        }

        });
    }

    get carname(){
    try{
       return this.car.data.fields.Name.value;
    }
    catch(error){
   return 'NA';
    }
    }
    get pictureUrl(){
        try{
          return  this.car.data.fields.Picture__c.value;
        }
        catch(error){
       return 'NA';
        }
        }
        get mileage(){
            try{
                console.log('mileage is',this.car.data.fields.Mileage__c.value);
              return this.car.data.fields.Mileage__c.value;
            }
            catch(error){
           return 'NA';
            }
            }


            get perdayrent(){
                try{
                    console.log('per day rent  is', this.car.data.fields.Per_Day_Rent__c.value);

                  return this.car.data.fields.Per_Day_Rent__c.value;
                }
                catch(error){
               return 'NA';
                }
                }

                get buildyear(){
                    try{
                        console.log( 'buildyear',this.car.data.fields.Build_Year__c.value);
                    return  this.car.data.fields.Build_Year__c.value;
                    }
                    catch(error){
                   return 'NA';
                    }
                    }

                    get type(){
                       
                        try{
                            console.log( 'type', this.car.data.fields.Car_Type__r.value.fields.Name.value);
                     return  this.car.data.fields.Car_Type__r.value.fields.Name.value;
                        }
                        catch(error){
                       return 'NA';
                        }
                        }

                    get ownername(){
                        try{
                            console.log( 'ownername', this.car.data.fields.Contact__r.value.fields.Name.value);
                         return this.car.data.fields.Contact__r.value.fields.Name.value;
                        }
                        catch(error){
                       return 'NA';
                        }  
                    }
}