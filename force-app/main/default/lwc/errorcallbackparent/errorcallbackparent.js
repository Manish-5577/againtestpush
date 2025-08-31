import { LightningElement } from 'lwc';

export default class Errorcallbackparent extends LightningElement {

stack ;
error ;
    handleparentinput(event)
    {
        try{
      console.log(event.target.value);
        }
        catch(error)
        {
               console.log('error in parent');
        }

    }
    errorCallback(error,stack)
    {
        console.log('parent1')
        console.log(JSON.stringify(error));
        this.error = error;
        this.stack = stack;
        console.log('parentmid')
        console.log(stack);
        console.log('parent1end')
        }
}