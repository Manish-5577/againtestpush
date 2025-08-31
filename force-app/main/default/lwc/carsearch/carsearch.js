import { LightningElement,api,track } from 'lwc';

export default class Carsearch extends LightningElement {

@track carTypeId ='';

    handleevent(event){
        console.log('8443338383');
       
         this.carTypeId = event.detail;
  
 /*  if(jj.length>10){
   console.log('car id is $$', this.carTypeId);
   this.carTypeId = jj;
   }
   else if(jj.length<3){
    this.carTypeId = '';
    console.log('dlksjdlakjals');
   }*/
    }




}