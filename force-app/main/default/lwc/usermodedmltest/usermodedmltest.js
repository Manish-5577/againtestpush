import { LightningElement,wire,track } from 'lwc';
import recordreturnwithusermode from '@salesforce/apex/Usermode.recordreturnwithusermode'
import useofusermode from '@salesforce/apex/Usermode.useofusermode'

const columns = [
    { label: 'Idd', fieldName: 'Id' },
    { label: 'Seurity_Checks', fieldName: 'securitycheck__c'}
];
export default class Sharingtesing extends LightningElement {
 @track datas;
 columns = columns;
    @wire(recordreturnwithusermode)
    record({data,error})
    {
        if(data)
        {
            console.log('data====>'+JSON.stringify(data));
        }
        if(error) {
            console.log(error);
            console.log('error  in record'+error.body.message);
         //  alert('error above mssg'+error.body.message);
        }
    }
    @wire(useofusermode)
    record({data,error})
    {
        if(data)
        {   
            console.log('data====>'+JSON.stringify(data));
            let rr = JSON.parse(JSON.stringify(data));
            rr.forEach(response => {
                response.Idd = response.Id;
                response.Seurity_Checks = response.securitycheck__c;

            });
           this.datas = rr;
        }
        if(error) {
            console.log(error);
            console.log('error  in strip inaccessible record'+error.body.message);
           alert('error above mssg'+error.body.message);
        }
    }


}