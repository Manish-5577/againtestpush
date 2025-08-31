import { LightningElement } from 'lwc';
//import abc from '@salesforce/apex/asynawaittest.abc';
import jjhhh from  '@salesforce/apex/asynawaittest.jj';
export default class Asyncawaittest extends LightningElement {



 async  handleClick()
{
      //  let firstresult = await abc();
    //    console.log('first result@@@@@@@@444$$$ ((((((((()))))))))'+typeof firstresult);
    console.log('####hhhhhhh');
  let abc3 = await jjhhh({});
          console.log('lets see 22n####result'+abc3);
          let abc2 = await jjhhh({});
          console.log('abc2');
}
}