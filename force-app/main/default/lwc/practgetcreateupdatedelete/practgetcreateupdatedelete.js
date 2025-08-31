import { LightningElement,wire,api } from 'lwc';
import { getRecord,createRecord, updateRecord } from 'lightning/uiRecordApi';
import account_object  from '@salesforce/schema/Account';
import idd from '@salesforce/schema/Opportunity.Id';
import amoountt from '@salesforce/schema/Opportunity.Amount';
import opp_name from '@salesforce/schema/Opportunity.Name';
import Name_field from '@salesforce/schema/Account.Name';

const fields = ["Opportunity.AccountId","Opportunity.Amount","Opportunity.CloseDate","Opportunity.CurrencyIsoCode"];

export default class Practgetcreateupdatedelete extends LightningElement {
@api recordId;
fieldsss={};
dataa;
    @wire(getRecord,{recordId : '$recordId', layoutTypes:['FULL'], modes:['View','edit','create']})
    opporecord({data,error})
    {console.log('record id is97878==>'+this.recordId);
        if(data){
            console.log('testing started'+ data);
            this.dataa = data;
            console.log('this dataa'+ JSON.stringify(this.dataa));
           // console.log('this dataa'+ JSON.stringify(this.dataa.fields.Amount.value));
        }else if(error)
        {  console.log('record id is 00==>'+this.recordId);
            console.log('error mssg==>'+JSON.stringify(error));
        }
    }

    @wire(getRecord,{recordId: '$recordId',fields :fields })
    opprecord({data,error}){
        if(data){
            console.log('data all fields'+JSON.stringify(data.fields));
        }
    }
    @wire(getRecord,{recordId :'$recordId', fields : [amoountt,opp_name]})
     opprecordd
   // ({data,error})
    // {
    //     if(data)
    //     {
    //         console.log('7777777777'+JSON.stringify(data));
    //     }
    // }

    get Name(){
        console.log('7777777777'+JSON.stringify(this.opprecordd));
        let value = '';
        if(this.opprecordd.data){
            value = this.opprecordd.data.fields.Name.value;
        }
        return value; //this.opprecordd.data.fields.Amount.value;
    }
 get ammount()

 {
    console.log('98273918231'+JSON.stringify(this.opprecordd));
    let value ='';
    if(this.opprecordd.data){
        value = this.opprecordd.data.fields.Amount.value;
    }
    return value;
 }
    handleClick(){
        const fields = {};
        fields[Name_field.fieldApiName] = 'testmanishhh';
        const accountreord = {apiName :account_object.objectApiName,fields :fields };
        createRecord(accountreord).then(response=>{
            console.log('testresponse'+JSON.parse(response))
        }).catch(error=>{
             console.log('error response'+error);
        })
    }
    handlechange(event){
       this.fieldsss[event.target.name] = event.target.value;
       console.log('event.target.value==>'+event.target.value);
    }
    handleupdate(event){
      /*  event.preventDefault();
        console.log('what happen ');
 const fieldse = {};
 fieldse[idd.fieldApiName] = this.recordId;
 fieldse[opp_name.fieldApiName] =  this.fieldsss.Name;
 console.log('yyyy'+this.fieldsss.Name);

 fieldse[amoountt.fieldApiName] =  this.fieldsss.Amount;
 console.log('yyeeeeeyy'+this.fieldsss.Amount);
 const updaterecords = {fieldse};
 console.log('fieldse value is'+JSON.stringify(fieldse));
 updateRecord(updaterecords).then((response)=>{
    console.log('finally done')
 }).catch((error)=>{
    console.log('finally got error');
 })*/
 const fieldse = {};
 fieldse[idd.fieldApiName] = this.recordId;
 fieldse[opp_name.fieldApiName] =  'tettttststss';
 //console.log('yyyy'+this.fieldsss.Name);

 fieldse[amoountt.fieldApiName] = 79879879;
 //console.log('yyeeeeeyy'+this.fieldsss.Amount);
 const updaterecords = {fieldse};
 console.log('fieldse value is'+JSON.stringify(fieldse));

 updateRecord(updaterecords).then((response)=>{
    console.log('finally done');
 }).catch((error)=>{
    console.log('finally got error');
 })
    }
   
}