import { LightningElement } from 'lwc';

export default class Errorcallbackchild extends LightningElement {
    handlechildinput(event)
    {
      console.log(event.targets.value);

    }
    errorCallback(error,stack)
    {
        console.log('child1')
        console.log(error);
        console.log('childmid')
        console.log(stack);
        console.log('child1end')
    }
}