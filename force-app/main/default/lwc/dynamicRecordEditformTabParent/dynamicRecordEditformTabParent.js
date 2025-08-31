import { LightningElement, api } from 'lwc';
import LightningToast from "lightning/toast";
import fieldListToRender from '@salesforce/apex/DynamicRenderinglogic.fieldListToRender'

export default class DynamicRecordEditformTabParent extends LightningElement {


  tablabels;
  @api recordId;

  connectedCallback() {
    console.log('recordId!!!!' + this.recordId)
    fieldListToRender().then((response) => {
      console.log(response);
      this.tablabels = response;
    }).catch((error) => {
      console.log(error);
    })
  }
  renderedCallback() {
    console.log('this record id' + this.recordId)
  }

}