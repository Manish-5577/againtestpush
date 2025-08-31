import { LightningElement,track,api } from 'lwc';
import getupcomingevent from '@salesforce/apex/sepakerinfofromeventpage.getupcomingevent';

const columnss = [
    { label: 'View', fieldName: 'detailPage',type: 'url',wrapText:false,
typeAttributes:{
    label:{
        fieldName:"namedf"
    }
}},
    { label: 'Name', fieldName: 'Name__c', cellAttributes:{
        iconName:"standard:event",iconposition:"left"
    } },
    //  { label: 'Location', fieldName: 'Location__c', type: 'text' },
    { label: 'Name', fieldName: 'Event_org',cellAttributes:{
        iconName:"standard:user",iconPosition:"left"
    } },
    { label: 'Location', fieldName: 'Location', type: 'text',cellAttributes:{
        iconName:"utility:location",iconPosition:"left"
    } },
    {label:"Details",fieldName:"Event_Details__c",type:"text",wrapText:true}
];
export default class Eventlistusingimperative extends LightningElement {


    @track dataa;
    @track filtereddataa;
    @track finaldataa;
    eventlist = columnss;

connectedCallback(){
  this.upcomingevent();
}
upcomingevent(){
    getupcomingevent().then((result)=>{
        console.log('result is!!!!!!!!! '+result);
    result.forEach(response => {
        console.log('&&@&&&@*@*@');
            console.log('response is ',response);
            response.namedf = response.Name__c; 
            console.log('testsrs(!!!!!!!!(!(!(!',response.Name__c);
           response.detailPage = "https://" + window.location.host + "/" + response.Id;
          
            response.Event_org =response.Event_Organizer__r.Name;
            if (response.Location__c){
                response.Location = response.Location__r.Name;
            }else{
                response.Location = "This is virtal Event"
            }
            if(response.Event_Detail__c){
                response.Event_Details__c = response.Event_Detail__c;
            }else {
                response.Event_Details__c = '';
            }
           
            // response.Name__c = response.Location__r.Name,
            // response.Phoness =response.Name__c,
            // response.Companyds  =response.Event_Organizer__r.Name

        });
      //console.log('result is ==>',result);
       this.dataa = result; 
       this.finaldataa = result;
       //this.errors = undefined;
        
        
       // console.log('responseis==>',result);
    }).catch(error=>{

        console.log('reason for error is ',error.body.message);
       // this.speakerlist = undefined ;
    })
    }
    handleserch(event){
     let searchword = event.detail;
     console.log('length of searchwordis ===>',searchword.length);
     let filteredvalue = this.dataa.filter((record,index,arrayobject)=>{
        return record.Name__c.toLowerCase().includes(searchword.toLowerCase());
        
     });
     //this.filtereddataa = filteredvalue;
     if(searchword){
     
     this.dataa = filteredvalue;
     }else{
   this.dataa =   this.finaldataa;
     }
    }
    handlelocationserch(event){
        let searchword = event.detail;
        let filteredvval = this.dataa.filter((record,indexe,arrayobject)=>{
            return record.Location.toLowerCase().includes(searchword.toLowerCase());
        })
     //   this.filtereddataa = filteredvval;
        if(searchword){
            this.dataa = filteredvval;
        }else{
            this.dataa =   this.finaldataa;
        }
    }
    handledatetime(event){
        let datetime = event.target.value;
        console.log('event value for date is ',event.value);
        console.log('3333333333333yydyd',this.dataa[0].Start_DateTime__c)
        let filteredvval = this.dataa.filter((record,indexe,arrayobject)=>{
            return record.Start_DateTime__c >= datetime;
        })
     //   this.filtereddataa = filteredvval;
        if(datetime){
            this.dataa = filteredvval;
        }else{
            this.dataa =   this.finaldataa;
        }
    }
}