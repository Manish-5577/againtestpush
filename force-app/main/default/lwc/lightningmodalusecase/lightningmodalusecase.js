import { LightningElement } from 'lwc';
import lightningmodalextension from 'c/lightningmodalextension';
import Description from '@salesforce/schema/Account.Description';
export default class Lightningmodalusecase extends LightningElement {

  async  handleClick()
    {
   const result = await lightningmodalextension.open({
    size :'large',
    Description : 'Searh product modal',
    label : 'search product',
    content : 'sample content from parent',
    pricebookId :'01sJ4000000wqVMIAY',
    index :0
   })
   console.log(result);
    }

}