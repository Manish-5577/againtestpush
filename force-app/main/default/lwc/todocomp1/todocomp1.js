import { LightningElement,wire,track,api } from 'lwc';
import fetchpicklist from '@salesforce/apex/taskpicklist.fetchpicklist';
import  createtaskrecord from '@salesforce/apex/taskpicklist.createtaskrecord'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Todocomp1 extends LightningElement {
@track loader  =false;
@track showmodal22 = false;
  @api taskrecord={
    "Subject":'',
    "ActivityDate":null,
    "Status":'',
    "Priority":'',
    "Description":''
  }
@track statusoption;
@track priorityoption;

@wire(fetchpicklist,{
    objectcApiName :"Task",
    fieldName :"Status"
}) 
wiresstatusvlaue1({error,data}){
    if(data){
        console.log(data);
        this.statusoption = data;
    }
    if(error){
        console.log('eooroor');
        console.error(error);
    }
}

@wire(fetchpicklist,{
    objectcApiName :"Task",
    fieldName :"Priority"
}) 
wiresstatusvlaue({error,data}){
    
    if(data){
        this.priorityoption = data;
    }
    if(error){
        console.error(error);
    }
}

handleChange(event){
    event.preventdefault;
   // this.taskrecord[event.target.name] = event.target.value;
    let existingvalues = {...this.taskrecord};
    existingvalues[event.target.name] = event.target.value;
    this.taskrecord = JSON.parse(JSON.stringify(existingvalues));
}

handleClick(){
       this.loader = true;
    if(this.validateinput() === false){
        return ;
    }

    
   console.log('recordcreateda',JSON.stringify(this.taskrecord));
   createtaskrecord({taskdata:JSON.stringify(this.taskrecord)}).then((result)=>{
    console.log('record created');

   
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'Task submitted succesfully',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
        const selecshowmodalfalse  = new CustomEvent(
            'falsee',{
                detail :{selectrecd :this.showmodal22}
            }
        );
        this.dispatchEvent(selecshowmodalfalse);
        console.log('event dispatchh at todocomp1');
    
   }
    
   ).catch(error=>{
    console.log('error  occourerd',error.body.message);
   }).finally(()=>{
    this.loader = false;
   })
}
validateinput(){

    const allValid = [
        ...this.template.querySelectorAll('lightning-input'),
    ].reduce((validSoFar, inputCmp) => {
        inputCmp.reportValidity();
        return validSoFar && inputCmp.checkValidity();
    }, true);

    const allValid2 = [
        ...this.template.querySelectorAll('lightning-combobox'),
    ].reduce((validSoFar, inputCmp) => {
        inputCmp.reportValidity();
        return validSoFar && inputCmp.checkValidity();
    }, true);

    return allValid && allValid2;
}
}