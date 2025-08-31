import { LightningElement,wire } from 'lwc';
import accountanditsconoppp from '@salesforce/apex/accountanditsrelatedconopp.accountanditsconoppp'
import {refreshApex}  from '@salesforce/apex';
 export default  class Accountandrelatedconopp extends LightningElement {


@wire(accountanditsconoppp,{})
abcdata({data,error})
{   console.log('wireee!!!first callingg');
    if(data)
    {
        console.log('testinggg!!!!!datata wireee'+data);
        console.log(data);
    }
    if(error)
    {
        console.log('lalalalalllLL!!!!')
    }
}
connectedCallback()
{
console.log('connected call testing who will call first');
accountanditsconoppp().then((data)=>{
       console.log('dataaa!!!'+JSON.stringify(data));
}).catch((error)=>{
     console.log(error);
})
}         

handlerefresh()
{
    refreshApex(this.abcdata);
    console.log('data refreshed!!!!!!!!!!');
}

}