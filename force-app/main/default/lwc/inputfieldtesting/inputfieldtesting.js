import { LightningElement,track } from 'lwc';
export default class Inputfieldtesting extends LightningElement {

@track abc = '22222222222'
handlechange(event)
{
    if(event.target.value)
    {
        console.log('lalalalalala$$'+this.abc);
       /* let abc = event.target.value;
         if(abc.length > 9){
            console.log('hure!!!!!!!!!!');
         }*/
    }
}
}