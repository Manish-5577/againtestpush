import { LightningElement } from 'lwc';
export default class EventCurrentTargetandTargetDiff extends LightningElement {




handleButtonClick(event)
{  //event.event.stopPropagation();
    console.log(event.target);
    console.log(event.currentTarget);
}

}