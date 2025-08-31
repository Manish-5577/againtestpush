import { LightningElement,wire } from 'lwc';
import initialoaddata from '@salesforce/apex/readonly.initialoaddata'
import getAccounts223 from '@salesforce/apex/AccountController.getAccounts223';
export default class Lwcrenderdsecond extends LightningElement {

@wire(initialoaddata,{})
datat({data,error})
{   console.log('wire outside first in child comp')
    if(data)
    { console.log('wire inside first in child comp')
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
  console.log('wire outside second in child comp')
if(result.data){
  //  console.log('data from refresh apex ')
   console.log('wire inside sec in child comp')
}
else if(result.error)
{  console.log('lalal');
    console.log(result.error);
  //  console.log('error in refresh apex ')
}
}
}