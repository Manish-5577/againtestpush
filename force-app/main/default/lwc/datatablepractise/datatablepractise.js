import { LightningElement,track } from 'lwc';
import wrapperdata from '@salesforce/apex/auraenabledmethod.wrapperdata'
export default class Datatablepractise extends LightningElement {
 showcondata = false;
 @track childconlist;
@track accountwraapper;
connectedCallback() {
        wrapperdata().then((response)=>{
               console.log('is it coming new practise')
               console.log(response);
               this.accountwraapper = response;
        }).catch((error)=>{
            console.log('error coming !!!!!!!!!')
           console.log(error);
        })
}
handleClick(event)
{  console.log('test');
   console.log(event.currentTarget.dataset.index);
   console.log(this.accountwraapper[event.currentTarget.dataset.index]);
    console.log(this.accountwraapper[event.currentTarget.dataset.index].cc);
    console.log('lalala');
    this.showcondata = true;
    this.childconlist = this.accountwraapper[event.currentTarget.dataset.index].cc;
}
handleClicktarget(event)
{   console.log('targett!!');
     console.log(event.target.label);
     console.log(event.currentTarget.label);
}
}