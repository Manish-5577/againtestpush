import { LightningElement,wire,track } from 'lwc';
import returnacc from '@salesforce/apex/sharingtesting.returnacc'
import countacount from '@salesforce/apex/inheritedsharing.countacount'
import calledbytrigger from '@salesforce/apex/nosharing.calledbytrigger'
import useofstripinaccessible from '@salesforce/apex/sharingtesting.useofstripinaccessible'
import { ShowToastEvent } from "lightning/platformShowToastEvent";
const columns = [
    { label: 'Idd', fieldName: 'Id' },
    { label: 'Seurity_Checks', fieldName: 'securitycheck__c'}
];
export default class Sharingtesing extends LightningElement {
 @track datas;
 columns = columns;
    @wire(returnacc)
    record({data,error})
    {
        if(data)
        { 
            console.log('data====>'+JSON.stringify(data));
        }
        if(error) {
           
           
            console.log('error  in record'+error.body.message);
         //  alert('error above mssg'+error.body.message);
        }
    }
    @wire(useofstripinaccessible)
    record({data,error})
    {
        if(data)
        {    alert('enteree or not ');
            console.log('data====>'+JSON.stringify(data));
            let rr = JSON.parse(JSON.stringify(data));
            rr.forEach(response => {
                response.Idd = response.Id;
                response.Seurity_Checks = response.securitycheck__c;

            });
           this.datas = rr;
        }
        if(error) {
            alert('error ');
            console.log(error);
            console.log('error  in strip inaccessible record'+error.body.message);
           alert('error above mssg'+error.body.message);
        }
    }
  /*  @wire(countacount)
    record({data,error})
    {
        if(data)
        { console.log('inherited data====>'+JSON.stringify(data));
            console.log(data);
           
        }
        else {
         //   console.log('inherited error==>'+error.body.message)
        }
       

    }*/
  /*  @wire(calledbytrigger)
    record({data,error})
    {
        if(data)
        { console.log('normal testing@@@@@@@@ data====>'+JSON.stringify(data));
            console.log(data);
           
        }
        else {
         //   console.log('inherited error==>'+error.body.message)
        }
       

    }*/


}