import { LightningElement,api } from 'lwc';

export default class LifecycleLWC extends LightningElement {

    @api publicvar = '989';
    objectt ={
      'name':'manish',
      'sirname':'chaudhary'
  }
     constructor(){
      super();
      //  this.publicvar = '234';
        console.log('public apivalue in constructor call back child==>'+this.publicvar);
         console.log('constructor childd called');
    // console.log(this.template.querySelector('lightning-button'));
    // console.log(this.template.querySelector('div'));
    // console.log(this.template.querySelector('h1'));

    }
     connectedCallback(){
    this.publicvar = '22';
      console.log('public apivalue in connected call back child==>'+this.publicvar);
        console.log('connectedcallback child is called');
    //     console.log(this.template.querySelector('lightning-button'));
    //     console.log(this.template.querySelector('div'));
    //     console.log(this.template.querySelector('h1'));
 }
    renderedCallback(){
        console.log('public apivalue in rendered call back child==>'+this.publicvar);
    //   this.publicvar =   333;
    console.log('component renderedCallback child  callback is called');
    //     console.log(this.template.querySelector('lightning-button'));
    //     console.log(this.template.querySelector('div'));
    //     console.log(this.template.querySelector('h1'));
     }
    // disconnectedCallback(){
    //     console.log('disconnected call back is called');
    //     console.log(this.template.querySelector('lightning-button'));
    //     console.log(this.template.querySelector('div'));
    //     console.log(this.template.querySelector('h1'));
    // }
    // errorCallback(error,stack)
    // { console.log('child==>');
    //     console.log(error);
    //     console.log(stack);
    //     console.log('child error end');
    // }
    // connectedCallback(){
    //   console.log('Child Connected Call Back called');
    //   throw new Error('problem in child component connectedCallback')
    //   }
    handlee(event)

     {console.log(event.targets.value);
     /* try {
      console.log(event.target.value);
      console.log('event fireddddd!!!!!');
      let neoobjectt = [...this.objectt];
      const evt = new CustomEvent('eventtest',{ detail: neoobjectt }
     
      )
      this.dispatchEvent(evt);
    } catch (error) {
       console.log(error);
    }*/
            
    }
    errorCallback(error,stack)
{ console.log('child error');
    console.log(error);
    console.log(stack);
    console.log('child error end');
}

checkobjectdetail()
{
  console.log(JSON.stringify(this.objectt));
  console.log('datA CHANGED IN CHILDD');
}
}