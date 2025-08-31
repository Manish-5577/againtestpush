import { LightningElement,wire,api,track } from 'lwc';
import { getAccounts } from './asyncawaitservicee.js';
import getallaccounte from '@salesforce/apex/allaccount2.getallaccounte'
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { mm1 }  from './ayncawaitserviceee.js'
import getacc from '@salesforce/apex/AccountController.getacc'
import {lal} from 'c/sharejs';
export default class Ayncawaitconcept extends LightningElement {

@api kk;@track htmlkey
@wire(getallaccounte )
lalal({data,error})
{
    if(data)
    {

    }
    if(error)
    {
        console.log(error);
    }
} $recordId
@wire(getacc,{mm : '$kk'})
ff({data,error})
{
    if(data)
    { console.log('blalalallaa')

    }
    if(error)
    {
        console.log(error);
    }
}

  async  handleCallfromService() {
        console.log('button is clicked whose label is Call Async Function from Service JS In Parent');
        console.log('what is getacount'+getAccounts())
        let accountlist = await getAccounts();
        console.log('button click is finishing now & list of account is ', accountlist);
        
    }
async mm()
{

        let jj = await getallaccounte().catch((error)=>{
            alert('habiibib'+JSON.stringify(error));
              console.log('error han455555555555'+JSON.stringify(error));
        });
        console.log('jjjjjj@788888888$$==>'+JSON.stringify(jj));
        let hh = await  this.nn();
        console.log('kkya hai y'+hh);
        let dd = await this.jj();
        console.log('hojaa  bhai'+dd);
        let kk = this.jj();
        console.log('kkk'+kk);
    } 
   

 nn()
{
    return getallaccounte();
}
async handleClickjss()
 {
    let jkk = await lal();
    console.log('########'+JSON.stringify(jkk));
 }


jj()
{
    return new Promise((resolve,reject)=>{
        resolve('data senttt@@@@@@@@@');
    })
}
 
async handleClick()
{
    let j = await mm1();
      console.log('uuu'+j);
}
handlechange(event)
{console.log('kkkrt');
   this.htmlkey = parseInt(event.target.value);
}
   
   async handlereject()
    {
        try{
        let kk = await getallaccounte();
        console.log('fter iteration ==>'+kk);
        }
        catch(error){
                console.log('error'+error);
                console.log(error);
        }
      
    }
renderedCallback()
{  console.log('jjjj');
    this.kk = this.htmlkey;
}

}