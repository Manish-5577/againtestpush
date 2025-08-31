import { LightningElement,track } from 'lwc';
import getaccountforlwc from '@salesforce/apex/lwcbookaccount.getaccountforlwc';
const column = [
    {label:"Name",fieldName:"Name",type:"text"},
    {label:"Rating",fieldName:"Rating",type:"text"},
    {label:"Industry",fieldName:"Industry",type:"text"},
    {label:"Phone",fieldName:"Phone",type:"text"},
   
]
export default class LwcBooknextpage extends LightningElement {
 @track Nos =1;
     @track data ;
     columns = column;
     connectedCallback(){
        this.handldedata();
     }
    handldedata()
    {
           console.log(typeof this.Nos);
        getaccountforlwc({No:this.Nos}).then(response=>{
            console.log('tetsts');
            console.log('response ==>',response);
            this.data = response;
        }).catch(error=>{
            console.log('error ')
        })
        
    }
    handlenext()
    {
        this.Nos =this.Nos+1;
        console.log('this.nos is ==>',this.Nos);
        getaccountforlwc({No:this.Nos}).then(response=>{
            console.log('tetsts');
            console.log('response ==>',response);
            this.data = response;
        }).catch(error=>{
            console.log('error ')
        })
    }
    handlePrevious()
    {
        this.Nos =this.Nos-1;
        if(this.Nos <1 ){
            this.Nos = 1;
        }
        console.log('this.nos is ==>',this.Nos);
        getaccountforlwc({No:this.Nos}).then(response=>{
            console.log('tetsts');
            console.log('response ==>',response);
            this.data = response;
        }).catch(error=>{
            console.log('error ')
        })
    }


}