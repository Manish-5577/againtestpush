import { LightningElement,wire,track,api } from 'lwc';
import fetchpicklist2  from '@salesforce/apex/taskpicklist.fetchpicklist2';
import createrecord from '@salesforce/apex/Usermode.createrecord';
import getcurrency  from '@salesforce/apex/freeapicurrencypart2.getcurrency';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Accountcreattionuiqueapproach extends LightningElement {

    @api accountrecord={
        "Name":'',
        "Industry":null,
        "Rating":'',
        "securitycheck__c":'',
        "stage__c":''
      }

@track industryy;
@track rating;
@track securitycheck;
@track stage;


handleClick2(event)
{
  getcurrency().then(result=>{
    console.log('record created succesfully ');
    alert('record created successfully'+JSON.stringify(result));
}).catch(error=>{
    console.log('tettttdtd'+error.body.message);
})
}



    @wire(fetchpicklist2,{
        objectcApiName :"Account",
        fieldName :"Industry"
    })
    wirerecord({data,error}){

        console.log('tetststtss');
          if(data){
        let array1 = [];
       for(let arr in data){
            array1.push({label:arr,value : data[arr]})
       }
            this.industryy = array1;
          }
    }
    @wire(fetchpicklist2,{
        objectcApiName :"Account",
        fieldName :"Rating"
    })
    wirerecord1({data,error}){
        console.log('tetststtss');
          if(data){
            console.log('rating data',data);

            let array2 = [];
            for(let arr1 in data){
                 array2.push({label:arr1,value : data[arr1]})
            }
            this.rating = array2;

          }

    }
    @wire(fetchpicklist2,{
        objectcApiName :"Account",
        fieldName :"securitycheck__c"
    })
    wirerecord2({data,error}){
        console.log('tetststtss');
          if(data){
            console.log('rating data',data);

            let array2 = [];
            for(let arr1 in data){
                 array2.push({label:arr1,value : data[arr1]})
            }
            this.securitycheck = array2;

          }
          
    }
    @wire(fetchpicklist2,{
        objectcApiName :"Account",
        fieldName :"stage__c"
    })
    wirerecord3({data,error}){
        console.log('tetststtss');
          if(data){
            console.log('rating data',data);

            let array2 = [];
            for(let arr1 in data){
                 array2.push({label:arr1,value : data[arr1]})
            }
            this.stage = array2;

          }
          
    }
    handlechange(event){
        //let objecttoparse = {...this.accountrecord};
        let objecttoparse = {...this.accountrecord};
        objecttoparse[event.target.name] =event.target.value;
        console.log('77777==>'+event.target.value);
        console.log('object data a=>', JSON.stringify(objecttoparse));
        this.accountrecord = JSON.parse(JSON.stringify(objecttoparse));
    }
  
    handleClick(){
        alert('====>'+JSON.stringify(this.accountrecord));
        createrecord({data: JSON.stringify(this.accountrecord)}).then(result=>{
            console.log('record created succesfully ');
            alert('record created successfully');
        }).catch(error=>{
               console.log(JSON.stringify(error));
            alert('tettttdtd'+error.body.message);
        })
    }
}