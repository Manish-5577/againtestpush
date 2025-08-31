import { LightningElement,api,wire } from 'lwc';
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';

export default class Getterandsetterchild extends LightningElement {
    _uppercaseItemName;
    
    @api testt;

    abc = 9;
    @wire(getallaccount,{num :'$abc'})
    abc({data,error})
    {
        console.log('wire approachh child 1111!!@@@')
    if(data)
    {   console.log('datat from woredd@@')
        this.accountrecordds = data;
       console.log(data);
    }
    else if(error)
    {console.log('erororor !!!')
        console.log(error);
    }
    }

    handlecustomevt(event)
    {
      console.log('event reachedddd!!!!$$$$$');
    }





    constructor()
    {super();
      console.log('getter called first or constructor  child111');
      this.testt = 'value set in constructor';
      //this.testt = 'changed in constructor';
    }
  @api get itemName() {
    console.log('api value in getter'+this.testt);
    return this._uppercaseItemName;
  }

  
set itemName(value) {
 //   let vv = 'hahah';
 console.log('api value in setter'+this.testt + value);
    if(value)
    { 
        this._uppercaseItemName = value;
    }
   // this._uppercaseItemName = value.toUpperCase();
  }
  connectedCallback()

  {console.log('this testt value child 111111'+this.testt);
    getallaccount({num :this.abc}).then((data)=>{
            console.log('data received in connected child 1111from apex')
    }).catch(error=>{
         console.log('error in connect call back 11111'+ error.body.message);
    })
    
   // this.testt = 'coming from connected';
    //console.log('whatis getter setterr connected callback @@@'+this._uppercaseItemName);
  }
  renderedCallback()
  {  console.log('thisstestt in rendere  child 111'+this.testt);
   // console.log('wha tiiid geter in renderede'+this._uppercaseItemName);
  }
}