import { LightningElement,wire,track} from 'lwc';
import fetchAccountContactData  from '@salesforce/apex/wrapperclassaccount.fetchAccountContactData';

const columnss = [
    { label: 'Name', fieldName: 'accountname' },
    { label: 'Name22', fieldName: 'ischeck', type: 'checkbox' },
    //  { label: 'Location', fieldName: 'Location__c', type: 'text' },
    { label: 'event organizer', fieldName: 'contactsiize', type: 'text' },
    { label: 'contact Name', fieldName: 'contactnamme', type: 'text' },
  
];
export default class Wrappercomp extends LightningElement {
@track columnlist = columnss;
@track datas;
   
    connectedCallback(){
        this.fetchewrapercall();
        
    }
    fetchewrapercall(){
        fetchAccountContactData().then(result=>{
       console.log('result====LLL>',result);
    
       result.forEach(response => {
        response.accountname = response.acc.Name;
        response.ischeck  = response.isCheck;
        response.contactsiize = response.contactSize;
        if((response.conList).length>0){
            for(var i =0;i<(response.conList).length;i++)
            {
                console.log('responsee===>',response.conList[i].Name);
                response.accountname = response.acc.Name;
                response.ischeck  = response.isCheck;
                response.contactsiize = response.contactSize;
            response.contactnamme = response.conList[0].Name

            }
        }else{
            console.log('esleee');
            response.contactnamme = 'No contact  Found';
        }
       })
       this.datas = result;
           }).catch(error=>{
            console.log('error ===>',error.body.message);
        })
    }

}