import { LightningElement,track,api } from 'lwc';

export default class ApidecorateusecaseCHILD extends LightningElement {

@api getparentval;

handleClick()
{
    console.log('kdljldksajlaksd');
    this.getparentval = 'handle api value coming from parent!!!@@'
}
}