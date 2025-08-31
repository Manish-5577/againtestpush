import { LightningElement,track,api  } from 'lwc';

export default class Lifecyclepart2 extends LightningElement {
    assignvaluetopublicvar ='999';
    normalproperty = 22212;
@track connectedvalue;
@track renderedvalue;
@api apiprpertytest = 444;
 hasrendered = true; 
// objectt ={
//     'name':'manish',
//     'sirname':'chaudhary'
// }
 constructor()
 { super();
    console.log('constructor called');
    console.log('public var'+this.assignvaluetopublicvar);
    console.log('this.normalprperty'+this.normalproperty);
    this.assignvaluetopublicvar = '1000';
    console.log('this.apiprpertytest'+this.apiprpertytest);
    
 }
connectedCallback() 
{
     console.log('parent connected callback ');
    this.connectedvalue = 'multiple check';
  
    console.log('this.apiprpertytest in conectedcallback'+this.apiprpertytest);
}
handleconnected()
{
    this.connectedvalue = 'multiple check for connected'; 
}
     renderedCallback()
     {
        console.log('parent rendereddd called');
     //   this.assignvaluetopublicvar = '555555';
    //    this.renderedvalue = 'multiple rendered';
        if(this.hasrendered)
        {
        this.renderedvalue = 'multiple rendered';
      console.log('rendereddd');
        this.hasrendered = false;
        }
     }
handlerendered()
{ // console.log('how many time fired');
    this.renderedvalue = 'multiple  rendered checkkk ';
}handlllechanaee(event)
{
    this.assignvaluetopublicvar = event.target.value;
    const evt = new CustomEvent('eventtest',
    { detail: objectt }
    )
    this.dispatchEvent(evt);
    // try {
    //     this.assignvaluetopublicvar = event.targets.value;
    // } catch (error) {
    //     console.log('handle try catch');
    //     console.log(error);
    // }

}
errorCallback(error,stack)
{ console.log('parent==>@@@@@@@@@@');
    console.log(error);
    console.log(stack);
    console.log('parent error end');
}
handleevent(event)
{
    console.log('event message');
       console.log(event);
       console.log(event.detail);
       const objj = event.detail;
       console.log('objjj==>'+JSON.stringify(objj));
       objj.name = 'umesh';
       console.log(JSON.stringify(objj));
}
}