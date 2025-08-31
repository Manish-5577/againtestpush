import { LightningElement,track,wire } from 'lwc';
import recordreturnwithusermode from '@salesforce/apex/Usermode.recordreturnwithusermode'
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import useofusermode from '@salesforce/apex/Usermode.useofusermode'
import lightningdatatable from '@salesforce/apex/AccountController.lightningdatatable'
const column = [
{ label: 'Id', fieldName: 'Id' },
{label: 'name', fieldName :'Name'}
];
export default class Lightningdatatablepractise extends LightningElement {
saveDraftValues = [];
@track datas = [];
@track columns = column ;
@track datta = [];
@track neodata = [];
@track loaddata = [];
initialvalue = 1;
@track accdata =[];
@track initialdata =[];
@track totalrecord = 0;
mapofdata = new Map(); 
disablenextbutton = false
disableprevbutton = true
connectedCallback() {
try{
lightningdatatable().then((response)=>{
    this.totalrecord = response.length;
    console.log('total record');
    let j = 50;let n = 0;
for(let i =0;i<this.totalrecord;i+=50)
{ 
n++;
this.mapofdata.set(n, []);
for(let m = i ;m< j ; m++)
{
    if(m<this.totalrecord){
    console.log(m);
    this.mapofdata.get(n).push(response[m]);
    console.log(JSON.stringify(this.mapofdata))
    }
}
j += 50;
if(n == 1)
{
    this.initialdata = this.mapofdata.get(1);
}
}

}).catch((error)=>{
        console.log('error occured while loading data');
        console.log(error);
})
}
catch(error)
{
    console.log('error reason ');
    console.log(error);
}
}

handlenextclick(event)
{ 
  this.initialvalue = this.initialvalue +1;
   if(this.mapofdata.has(this.initialvalue))
   {
     this.initialdata = [] ;
     this.disableprevbutton =  false;
     this.initialdata = this.mapofdata.get(this.initialvalue); 
   }
   else{
    this.disablenextbutton = true;
   }
}
handleprevclick(event)
{
    this.initialvalue = this.initialvalue - 1;
    console.log('this.initial value '+this.initialvalue);
    if(this.initialvalue <= 1)
    {
      this.initialdata = [] ;
      this.initialdata = this.mapofdata.get(1); 
      this.disableprevbutton = true ;
      this.disablenextbutton = false;
    }
    else{
         this.initialdata = [] ;
      this.initialdata = this.mapofdata.get(this.initialvalue); 
            this.disableprevbutton = false ;
            this.disablenextbutton = false;
    }
}









//       @wire(useofusermode)
//         record({data,error})
//         {
//             if(data)
//             {   console.log('testing@@@!!!');
//                           this.datas = data;
//                           this.neodata = data;
//              console.log('data====>'+JSON.stringify(data));

//             //     let rr = JSON.parse(JSON.stringify(data));
//             //     rr.forEach(response => {
//             //         response.Idd = response.Id;
//             //         response.Seurity_Checks = response.securitycheck__c;

//             //     });
//             //    this.datas = rr;
//             }
//             if(error) {
//                 console.log('erririi');
//                 console.log(error);
//                 console.log('error  in strip inaccessible record'+error.body.message);
//                alert('error above mssg'+error.body.message);
//             }
//         }

//         connectedCallback()
//         {
//             useofusermode().then((abc)=>{
//                 console.log('blabla!!');
//                 console.log(abc);
//             let ll =     JSON.parse(JSON.stringify(abc));
//                // this.datta  = response;
//              //  let rr = JSON.parse(JSON.stringify(response));
//             ll.forEach(response => {
//                       response.Idhhh = response.Id;
//                        response.owneridsss = response.securitycheck__c;
//                        response.Industryyy = response.securitycheck__c;
//                        response.Seurity_Checksuuu = response.securitycheck__c;
//                        response.phone = response.phone;
    
//                    });
//                 this.datta = abc;
//             }).catch((error)=>{
            
//                 console.log('ligtinigndata t22222222###'+ JSON.stringify(error));
//                 console.log(error);
//             })
//         }
//         handleSave(event) {
//             this.saveDraftValues = event.detail.draftValues;
//             const recordInputs = this.saveDraftValues.slice().map(draft => {
//                 const fields = Object.assign({}, draft);
//                 return { fields };
//             });
    
//             // Updateing the records using the UiRecordAPi
//             const promises = recordInputs.map(recordInput => updateRecord(recordInput));
//             Promise.all(promises).then(res => {
//                 this.ShowToast('Success', 'Records Updated Successfully!', 'success', 'dismissable');
//                 this.saveDraftValues = [];
//                 this.refresh()
//                // return this.refresh();
//             }).catch(error => {
//                 this.ShowToast('Error', 'An Error Occured!!', 'error', 'dismissable');
//             }).finally(() => {
//                 this.saveDraftValues = [];
//             });
//         }
//         ShowToast(title, message, variant, mode){
//             const evt = new ShowToastEvent({
//                     title: title,
//                     message:message,
//                     variant: variant,
//                     mode: mode
//                 });
//                 this.dispatchEvent(evt);
//         }
    
//         // This function is used to refresh the table once data updated
//       refresh() {
//          refreshApex(this.neodata);
//         }
//         handlepush()
//         {  console.log('lalalal')
//           //    let abcc = {"Id":"0015j00001d9M1XAAU","Industry" :"Communications","OwnerId" :"kjslakjd","securitycheck__c" :"read/write","Phone":"312###########"};
//           const abcc =     {"Id":"0015j00001d9","securitycheck__c":"read/write","OwnerId":"0055j000AO","Industry":"Communications","Phone":"312###########"};
//           console.log('hhhh@@@!!!!!!!');
//    //  this.datas.push(JSON.parse(JSON.stringify(abcc)));
//      console.log('hhhh33');
//     //   this.datta.push(abcc);
//        console.log('hhhh33');
//        this.neodata.push(abcc);
//        console.log('hureeeee!!!44');
//     }

}