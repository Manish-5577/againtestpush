import { LightningElement,api,track} from 'lwc';
import getspeaker from '@salesforce/apex/sepakerinfofromeventpage.getspeaker';
import getaattendee from '@salesforce/apex/sepakerinfofromeventpage.getaattendee';
import getlocations from '@salesforce/apex/sepakerinfofromeventpage.getlocations';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import {NavigationMixin} from 'lightning/navigation';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Company', fieldName: 'Company', type: 'text' },
];

const columnsattende = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Company', fieldName: 'Company', type: 'text' },
];


export default class Eventrecordform extends NavigationMixin(LightningElement) {
errors;
    @api recordId;
@track speakerlist ;
@track attendeelist =[];
 columns = columns;
 columnsattende = columnsattende;
 @track loction;
    showspeakerlist(){
        console.log('this recordid is ==>',this.recordId)
        getspeaker({eventid:this.recordId}).then((result)=>{
            console.log('result is '+result);
            let rr =  JSON.parse(JSON.stringify(result));
            rr.forEach(response => {
                console.log('response is ',response);
                console.log('response is ==7777',response.Speaker__r
                .Name);
                response.Name = response.Speaker__r.Name,
                response.Email = response.Speaker__r.Email__c,
                response.Phone =response.Speaker__r.Phone__c,
                response.Company = response.Speaker__r.Company__c
          //     response.About_Me__c = response.Speaker__r.About_Me__c,
           //    response.Picture__c = response.Speaker__r.Picture__c
            });
           console.log('result is ==>',result);
           this.speakerlist = rr;
           //this.errors = undefined;
            console.log('responseis==>',this.speakerlist);
        }).catch(error=>{
            //console.log('reason for error is ',error.body.message);
            this.speakerlist = undefined ;
        })
    }

    showlocation(){
        getlocations({eventid:this.recordId}).then(response=>{
            console.log('response of locatiion is',response[0]);
            this.loction =response;
            console.log('233333',response[0].Location__r.Street__c);
        }).catch(error=>{
          //  this.errors = error.body.message;
        })
    }
    showattendeeinfo(){
        getaattendee({eventid:this.recordId}).then((result)=>{
            console.log('result of  eventtttende!!!!!!!! '+result);
            result.forEach(response => {
                console.log('response is ',response);
           
                response.Name = response.Attendee__r.Name,
                response.Email = response.Attendee__r.Email__c,               
                response.Phone =response.Attendee__r.Phone__c
                response.Company =response.Attendee__r.Company_Name__c
            });
           console.log('result is ==>',result);
          this.attendeelist = result;
           //this.errors = undefined;
            
            
        }).catch(error=>{
            console.log('error is==>',error.body.message);
        })
    }

createspeaker(){
    const defaultValues = encodeDefaultFieldValues({
        Event__c : this.recordId
    });
    this[NavigationMixin.Navigate]({
        type:"standard__objectPage",
        attributes:{
            objectApiName:"EventSpeakers__c",
            actionName:"new"
        },
        state: {
            defaultFieldValues:defaultValues
        }
    })
}
createattende(){
    const defaultValues = encodeDefaultFieldValues({
        Event__c : this.recordId
    });
    this[NavigationMixin.Navigate]({
        type:"standard__objectPage",
        attributes:{
            objectApiName:"Event_Attendee__c",
            actionName:"new"
        },
        state:{
   defaultFieldValues:defaultValues
        }
    })
}




}