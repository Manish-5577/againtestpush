import { LightningElement,track,api } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import {xyz} from 'c/sharejsamongallcomp';
import hasPermission from "@salesforce/customPermission/iamsystemadmin";
export default class Firstcalculator extends LightningElement {
    @track currentresult;
    @track  storeprevioushistory = [];
    @track bb =false;
    @api  testing;
    firstnumber;
    secondnumber;
    numberchange(event){
        const whichinput = event.target.name;
    if(whichinput === 'FirstNumber'){
               this.firstnumber = event.target.value;
    }
    else if(whichinput === 'secondnumber'){
   this.secondnumber = event.target.value;
    }
}
connectedCallback() {
    alert('connectedd@@@9999')
    const jj =  xyz();
    console.log('what is jj==>'+jj);
}

get hh()
{   alert('@@@@@@@@@!!******s'+ hasPermission)
    return hasPermission;
}
adds(){
    const firstn = parseInt(this.firstnumber);
    const secondn = parseInt(this.secondnumber);
   // this.currentresult  =   'result of '+ firstn +'+'+ secondn +'is'+ (firstn+secondn);
    this.currentresult = `resulty of ${firstn} + ${secondn} is ${firstn+secondn}`;
    this.storeprevioushistory.push(this.currentresult);
}
sub(){
    const firstn = parseInt(this.firstnumber);
    const secondn = parseInt(this.secondnumber);
  //  this.currentresult  =   'result of '+ firstn +'+'+ secondn +'is'+ (firstn+secondn);
    this.currentresult = `resulty of ${firstn} + ${secondn} is ${firstn-secondn}`;
    this.storeprevioushistory.push(this.currentresult);
}
mult(){
    const firstn = parseInt(this.firstnumber);
    const secondn = parseInt(this.secondnumber);
   // this.currentresult  =   'result of '+ firstn +'+'+ secondn +'is'+ (firstn+secondn);
    this.currentresult = `resulty of ${firstn} + ${secondn} is ${firstn*secondn}`;
    this.storeprevioushistory.push(this.currentresult);
}
divides(){
    const firstn = parseInt(this.firstnumber);
    const secondn = parseInt(this.secondnumber);
 //   this.currentresult  =   'result of '+ firstn +'+'+ secondn +'is'+ (firstn+secondn);
    this.currentresult = `resulty of ${firstn} + ${secondn} is ${firstn/secondn}`;
    this.storeprevioushistory.push(this.currentresult);
}
check(event){
 this.bb = event.target.checked;
}
renderedCallback()
{
    console.log('how many time rendered call back fired in calculater');
}
}