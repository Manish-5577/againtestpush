import { LightningElement, track,api } from 'lwc';

export default class Revisionpublicpropertychild extends LightningElement {



   @track value = ['red'];

options =  [
            { label: 'green', value: 'green' },
            { label: 'red', value: 'red' },
            { label: 'orange', value: 'orange' },
            { label: 'black', value: 'black' },
        ]

    
       @api selectedfunc(parentcolor){
            console.log('parentcolor is '+parentcolor);
            const selectedcolor = this.options.find((checkcolor) =>{
                             return parentcolor === checkcolor.value;
            })
        
        if(selectedcolor)
        {
            this.value = selectedcolor.value;
            console.log('this value i%%%%'+this.value);
           return  this.value;
        }
       console.log('ksjdkaldjkd');
       alert('no color found');
           return "no color found";
    
    }
}