import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/readonly.getAccounts'
import getdatabyIdapproach from '@salesforce/apex/readonly.getdatabyIdapproach'
import initialoaddata from '@salesforce/apex/readonly.initialoaddata'
import getAccounts223 from '@salesforce/apex/AccountController.getAccounts223';
import initialoaddata333 from '@salesforce/apex/readonly.initialoaddata333'
import initialoaddata33344 from '@salesforce/apex/readonly.initialoaddata33344'
export default class Lwcrenderdfirst extends LightningElement {

constructor()
{
    super();
    console.log('constructor called');
}


// @wire(initialoaddata333,{})
// datat({data,error})
// { console.log('wire outside first')
//     if(data)
//     {  console.log('inside wire first')
//         console.log('huree testingg@@##');

//     }
//     else if(error)
//     {
//         console.log('without cache!!!!!!!!!!!!!!');
//         console.log(error);
//     }
// }
// @wire(initialoaddata33344,{})
// datat({data,error})
// {  console.log('wire outside second')
//     if(data)
//     {    console.log('inside wire second')
//         console.log('huree testingg@@')
//     }
//     else if(error)
//     {
//         console.log('with cache');
//         console.log(error);
//     }
// }

@wire(initialoaddata,{})
datat({data,error})
{   console.log('wire outside first')
    if(data)
    { console.log('wire inside first')
        console.log('huree testingg@@')
    }
    else if(error)
    {
        console.log('jjjjjj');
        console.log(error);
    }
}

   @wire(getAccounts223)
wiredAccounts( result ){
 console.log('wire outside sec in first comp')

if(result.data){
  //  console.log('data from refresh apex ')
   console.log('wire inside sec in first comp')
}
else if(result.error)
{  console.log('lalal');
    console.log(result.error);
  //  console.log('error in refresh apex ')
}
}
connectedCallback() {
   console.log('connected callback');
}
renderedCallback(){
    console.log('rendered callback');
}


}