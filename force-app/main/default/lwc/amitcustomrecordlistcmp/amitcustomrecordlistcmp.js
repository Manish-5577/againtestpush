import { LightningElement,api } from 'lwc';

export default class Amitcustomrecordlistcmp extends LightningElement {

    @api record;
    @api fieldname;
    @api iconname;
    @api displayname ='';
   valuee ='';
    handleSelect(event){
        event.preventDefault();
        const selectedRecord = new CustomEvent(
            "select",
            {
                detail : this.record.Id
            }
        );
        /* eslint-disable no-console */
        //console.log( this.record.Id);
        /* fire the event to be handled on the Parent Component */
        this.dispatchEvent(selectedRecord);
    }
  connectedCallback()
  { console.log('&&&&&&&&&&&&&&&@@@on recordin recordlist comp');
//   console.log('display name '+this.displayname);
//     console.log(JSON.stringify(this.record));
//   const gg = this.displayname;
//     let accounts = JSON.parse(JSON.stringify(this.record));
// console.log(accounts[gg]);
// this.valuee = accounts[gg];
// console.log('this .valuee  ==>'+this.valuee);
  }
  get displayfieldvalue()
  {  const gg = 'ProductCode';
    console.log('getter test'+gg);
    return this.record.gg;
  }
  get valuereturn()
  {
    console.log(JSON.stringify(this.record));
  const gg = this.displayname;
    let accounts = JSON.parse(JSON.stringify(this.record));
console.log(accounts[gg]);
this.valuee = accounts[gg];
console.log('this .valuee  ==>'+this.valuee);
return this.valuee;
  }

    
}