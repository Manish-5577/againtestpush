import { LightningElement,api } from 'lwc';

export default class Getterandsettergreatchild extends LightningElement {
  abc = {
    name : 'mani',
    sirname : 'cha'
  }
  hh ;

  @api 
   set grandchild(value)
  {
         console.log('this valuee in grand chid setter'+value);
         this.hh = value;
        
  }
  get grandchild()
  {
    console.log('this value in getter cgrand child');
     return this.hh;
  }
    

    handleClick(event)
    {    console.log('event fired!!!@@@@LLLLL%%%%%$$$$222255577888999');
        let ff = new CustomEvent("cc",{
            detail :this.abc,
            bubbles :true,
            composed : true,
        })
        this.dispatchEvent(ff);
    }
}