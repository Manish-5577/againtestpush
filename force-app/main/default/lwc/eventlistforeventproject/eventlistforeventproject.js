import { LightningElement,wire,track } from 'lwc';
import getupcomingevent from '@salesforce/apex/sepakerinfofromeventpage.getupcomingevent';


    const columnss = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Name22', fieldName: 'Name__c', type: 'text' },
        //  { label: 'Location', fieldName: 'Location__c', type: 'text' },
        { label: 'event organizer', fieldName: 'Phoness', type: 'text' },
        { label: 'Company', fieldName: 'Companyds', type: 'text' }
    ];

export default class Eventlistforeventproject extends LightningElement {
  @track dataa;
    eventlist = columnss;



   handleClick(){
    getupcomingevent().then((result)=>{
        console.log('result is '+result);
        result.forEach(response => {
            console.log('response is ',response,'3323',response.Location__r.Name);
           
            response.Name =response.Location__r.Name,
            response.Name__c = response.Location__r.Name,
            response.Phoness =response.Name__c,
            response.Companyds  =response.Event_Organizer__r.Name

        });
      //console.log('result is ==>',result);
       this.dataa = result; 
       //this.errors = undefined;
        
        
       // console.log('responseis==>',result);
    }).catch(error=>{

        console.log('reason for error is ',error.body.message);
       // this.speakerlist = undefined ;
    })
    }

   

  
}