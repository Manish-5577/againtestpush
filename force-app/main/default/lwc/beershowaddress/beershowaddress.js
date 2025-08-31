import { LightningElement,api } from 'lwc';
export default class Beershowaddress extends LightningElement {
   
          @api address;
          @api  indexx;
handlenewaddress()
{
             this.dispatchEvent(new CustomEvent("navigatetobeershowaddress"));                                        
}
deliverhere()
{  console.log('isisisilalal@2');
    this.dispatchEvent(new CustomEvent("deliverwhichaddress",{detail: this.address.Id}));
}
}