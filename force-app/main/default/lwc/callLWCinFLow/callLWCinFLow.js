import { LightningElement, api } from 'lwc';
import {FlowNavigationNextEvent} from 'lightning/flowSupport';
import {showToastEvent} from 'lightning/platformShowToastEvent';
export default class CallLWCinFLow extends LightningElement {

@api
availableActions = [];
@api
accountRecordId;
@api 
test1
@api test2
objectApiName = 'Account';
fields =['Name','Type','Industry'];
handlesuccess(event)
{  alert('test');
//  const evt =  new showToastEvent({
//     title :"Record update",
//     message :"Account record is updated successfullly",
//     variant:"success"
//  });
//  this.dispatchEvent(evt);
 alert('test2');
this.handleGoNext();
alert('test3');
}
handleGoNext()
{alert('test4');
if (this.availableActions.find((action) => action === 'NEXT')) {
    // navigate to the next screen
    const navigateNextEvent = new FlowNavigationNextEvent();
    this.dispatchEvent(navigateNextEvent);
}
alert('test55');
}
handlenavigation()
{
   this.test2 = 'yes';
}

}