import { LightningElement,api,track} from 'lwc';
import getattendeeinfo from '@salesforce/apex/sepakerinfofromeventpage.getattendeeinfo';

import getattendeepastevent from '@salesforce/apex/sepakerinfofromeventpage.getattendeepastevent';

const columnss = [
    { label: 'Name', fieldName: 'eventdetailPage',type: 'url',wrapText:false,
typeAttributes: {
    label:{
        fieldName:'Namegg'
    }
}},
    { label: 'Attende Name', fieldName: 'attName', cellAttributes:{
        iconName:"standard:event",iconposition:"left"
    } },
   
    { label: 'Event DDate', fieldName: 'Eventdate' ,type: 'Datetime'
     },
    { label: 'Location', fieldName: 'Location', type: 'text',cellAttributes:{
        iconName:"utility:location",iconPosition:"left"
    } }
];
export default class Attendeeupcomingevent extends LightningElement {

eventlist = columnss;
@api recordId;
@track attendeventlist;
@track attendpasteventlist


connectedCallback(){
this.attendpupcomingevent();
this.attendepastevent();
}
        attendpupcomingevent(){
            getattendeeinfo({id:this.recordId }).then(result=>{
                console.log('result is333333=>',result);
                result.forEach(response => {
                    console.log('response.Attendee__r.Name',response.Attendee__r.Name);
                    console.log('tetestete');
                    console.log('response.Attendee__r.Name',response.Event__r.Start_DateTime__c);
                    console.log('4433333e');
                    console.log('response.Attendee__r.Name',response.Event__r.Location__r.Name);
                    console.log('response.Attendee__r.Name',response.Attendee__r.Name);
                    console.log('response.Attendee__r.Name',window.location.host + '/' + response.Event__c);
                    response.Namegg =response.Event__r.Name__c;
                    response.eventdetailPage ="https://" + window.location.host + "/" + response.Event__c;
                    
                    response.attName =response.Attendee__r.Name;
           
                     response.Eventdate  =response.Event__r.Start_DateTime__c;
                     if(response.Event__r.Location__r){
                        response.Location = response.Event__r.Location__r.Name;
                     }else{
                        response.Location ='No location found '; 
                     }
                
                });
                this.attendeventlist = result;

            }).catch(error=>{
                console.log(error.body.message);
                this.attendeventlist = undefined;
            } );
        }



        attendepastevent(){
            getattendeepastevent({id:this.recordId }).then(result=>{
                console.log('result is333333=>',result);
                result.forEach(response => {
                    console.log('response.Attendee__r.Name',response.Attendee__r.Name);
                    console.log('tetestete');
                    console.log('response.Attendee__r.Name',response.Event__r.Start_DateTime__c);
                    console.log('4433333e');
                    console.log('response.Attendee__r.Name',response.Event__r.Location__r.Name);
                    console.log('response.Attendee__r.Name',response.Attendee__r.Name);
                    console.log('response.Attendee__r.Name',window.location.host + '/' + response.Event__c);
                    response.Namegg =response.Event__r.Name__c;
                    response.eventdetailPage ="https://" + window.location.host + "/" + response.Event__c;
                    
                    response.attName =response.Attendee__r.Name;
           
                     response.Eventdate  =response.Event__r.Start_DateTime__c;
                     if(response.Event__r.Location__r){
                        response.Location = response.Event__r.Location__r.Name;
                     }else{
                        response.Location ='No location found '; 
                     }
                
                });
                this.attendpasteventlist = result;

            }).catch(error=>{
                console.log(error.body.message);
                this.attendpasteventlist = undefined;
            } );
        }
}