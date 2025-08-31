import { LightningElement ,api,track} from 'lwc';

export default class Publicmethodchild extends LightningElement {
     @track value = ['red'];

options =  [
            { label: 'green', value: 'green' },
            { label: 'red', value: 'red' },
            { label: 'orange', value: 'orange' },
            { label: 'purple', value: 'purple' }
]  


   @api selectcheckbox(checkboxValue){
    console.log('value of checkbox'+checkboxValue);
    const selectedCheckbox =  this.options.find((checkbox)=>{
        console.log('JJJJjsjdsjdhs');
        console.log('let chek the step');
        return checkboxValue === checkbox.value;
       
    });
    if(selectedCheckbox){
        this.value = selectedCheckbox.value;
        console.log('let chek the step2222');
        return "Successfully checked";
    } 
    console.log('let chek the step4444444');
    return "No checkbox found";
   }
}