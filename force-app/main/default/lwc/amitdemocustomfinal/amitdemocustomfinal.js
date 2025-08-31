import { LightningElement } from 'lwc';

export default class Amitdemocustomfinal extends LightningElement {


    handleLookupSelection(event)
    {
      if(event.detail.selectedRecord != undefined){
        console.log('Selected Record Value on Parent Component is ' +  
        JSON.stringify(event.detail.selectedRecord));
        alert(event.detail.selectedRecord.Id + ' '+ event.detail.selectedRecord.Name);
    }
    }
}