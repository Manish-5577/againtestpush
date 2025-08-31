import { LightningElement,track} from 'lwc';

export default class Auraif extends LightningElement {
         displaytrue ;
   citylist = ['mani','suni','runi','puni'];

        auraiff(event)
        {
         this.displaytrue   = event.target.checked;
        }
}