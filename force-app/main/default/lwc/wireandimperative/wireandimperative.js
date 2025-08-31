import { LightningElement } from 'lwc';
import imperativetest from '@salesforce/apex/Allaccount.imperativetest'
export default class Wireandimperative extends LightningElement {


    handleClick(event)
    {
        imperativetest().then((data)=>{
             console.log(data);
        }).catch((error)=>{
            console.log('testing');
                   console.log(error)
        })
       
    }
}