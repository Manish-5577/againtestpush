import { LightningElement,wire } from 'lwc';
 import getallaccount from '@salesforce/apex/Allaccount.getallaccount'
export default class ApexcallingWireApproach extends LightningElement {

    @wire(getallaccount)accounts;
    getresponse(){
        if(this.accounts){
            return true;
        }
        return false;
    }

}