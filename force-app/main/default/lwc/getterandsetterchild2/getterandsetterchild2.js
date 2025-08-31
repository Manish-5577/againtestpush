import { LightningElement,wire,api } from 'lwc';
import getallaccounte from '@salesforce/apex/allaccount2.getallaccounte';

export default class Getterandsetterchild2 extends LightningElement {
manipulation;


     constructor()
     {  super();
        console.log('constructore caledded')
     }

     @wire(getallaccounte,{})
       wiredata({data,error})
       {   console.log('wiree outside');
        if(data)
        {
            console.log('wire')
        }
       }


           set value1(val)
          { console.log('setter called')
           this.manipulation = val;
          }
          @api
          get value1()
          {  console.log('getter called')
               return  this.manipulation;
          }

   connectedCallback() {
    console.log('connected 1');
   }


//     abc = 9;
//     @wire(getallaccount,{num :'$abc'})
//     abc({data,error})
//     {
//         console.log('wire approachh child2222222!!@@@')
//     if(data)
//     {   console.log('datat from woredd@@')
//         this.accountrecordds = data;
//        console.log(data);
//     }
//     else if(error)
//     {console.log('erororor !!!')
//         console.log(error);
//     }
//     }

//     constructor()
//     {  super();
//         console.log('constructore called in child 2');
//     }
//     connectedCallback()
//     {
//         console.log('connected calllback  called in child 2');
//         getallaccount({num :this.abc}).then((data)=>{
//             console.log('data received in connected child  22222from apex')
//     }).catch(error=>{
//         console.log('error in connect call back 2222222'+ error.body.message);
//    })
//     }
//     renderedCallback()
//     {
//         console.log('rendered callback in child 2');
//     }
}