import { LightningElement,api } from 'lwc';

export default class Genericrecordform extends LightningElement {

    @api recordId;
    @api  objectApiName;


handlesuccess(){
    console.log('rceordid generated is ',recordId);
}
// testapi(){
//     console.log('reorid ',this.recordId);
//     console.log('objectapi name is  ',this.objectApiName);
// }
}