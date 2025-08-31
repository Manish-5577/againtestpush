import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Inputvalidatetesting extends LightningElement {


    handleClick(event)
    {
        console.log('Current value of the input: ' + event.target.value);

        const allValid = [
            ...this.template.querySelectorAll('lightning-input'),
        ].reduce((validSoFar, inputCmp) => {
            console.log('default valur of valid so far'+validSoFar);
            inputCmp.reportValidity();
            console.log(validSoFar && inputCmp.checkValidity());
            if(!(validSoFar && inputCmp.checkValidity()))
            {console.log('yyyyy');
                console.log(inputCmp);
                console.log(inputCmp.label);
                inputCmp.label = '###@@@@@@#####'
                inputCmp.style.color = 'green';
            }
            return validSoFar && inputCmp.checkValidity();
        }, true);
        if (allValid) {
            alert('All form entries look valid. Ready to submit!');
         }
        // else {
        //     alert('Please update the invalid form entries and try again.');
        // }
    }
}