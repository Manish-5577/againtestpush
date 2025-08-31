import { LightningElement,api,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CurrentPageReference } from 'lightning/navigation';

export default class Lightningquickaction extends LightningElement {
// @api recordId;
@api recd;
 wireRecordId; //this will hold the current record id fetched from pagereference
    currectRecordId;
//     @api invoke()
//     {
//            alert('quick action callleded!!!!!');
//   alert('this record id ==>'+this.recordId);

//     }
//     @wire(CurrentPageReference)
//     abcc(currentPageReference)
//     {
//         if(currentPageReference)
//         {
//            this.recd =  currentPageReference.state.recordId;
//         }
//     }
//   @api set recordId(value) {
//         this.recd = value;
//         console.log('this.currectRecordId ',this.recd);

//         //onload action here where you need current recordid
//         //this gets executed post connected callback
//     }

//     get recordId() {
//         return this.recd;
//     }

    // connectedCallback()
    // {     alert('this record id  connected callback ==>'+this.recordId + this.recd) ;
    //     alert('qconnectedcallb##########55555555555555');
    // }
      //this will hold the current record id fetched from getter and setter

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            console.log('currentPageReference ', currentPageReference);
            //it gets executed before the connected callback and avilable to use
            this.wireRecordId = currentPageReference.attributes.recordId;
        }
    }

    @api set recordId(value) {
        this.currectRecordId = value;
        console.log('this.currectRecordId ',this.currectRecordId);

        //onload action here where you need current recordid
        //this gets executed post connected callback
    }

    get recordId() {
        return this.currectRecordId;
    }



    connectedCallback() {
        //not available in connected callback
        console.log('currectRecordId @@@@', this.currectRecordId);
        // available in connected callback
        console.log('wireRecordId @@!!!', this.wireRecordId);
        alert('currectRecordId @@@@', this.currectRecordId);
         alert('wireRecordId @@!!!', this.wireRecordId);
    }
}