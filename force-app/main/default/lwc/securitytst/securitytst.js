import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getaccountsd from '@salesforce/apex/triggerhandlerforcountallacccount.getaccountsd';
const colum =[
    {label:"Account Name",fieldName:"name"},
    {label:"Account Rating ",fieldName:"rating"},
    {label:"Account Industry ",fieldName:"industry"},
    {label:"Account Security ",fieldName:"securitycheck__c"},
    {label:"Account Stage ",fieldName:"stage__c"}
 
]

export default class Securitytst extends LightningElement {
    columns= colum;
    data;
    handleclick(){
        console.log('testtss');
        getaccountsd().then((result)=>{
                    console.log('22222222',result);
                    result.forEach(element => {
                        element.name = element.Name;
                        element.rating = element.Rating;
                        element.industry = element.Industry;
                        element.securitycheck__c = element.securitycheck__c;
                        element.stage__c = element.stage__c;
                    });
                    this.data = result;
        }

        ).catch(error=>{
            console.log('error ',error);
            alert('Error reason is '+error.body.message);
           
        })
    }

}