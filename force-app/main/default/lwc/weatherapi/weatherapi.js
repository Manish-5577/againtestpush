import { LightningElement,track } from 'lwc';
import parse from '@salesforce/apex/practweatherapi.parse';
export default class Weatherapi extends LightningElement {


@track locationval
@track imglink
handlechange(event){
  this.locationval = event.target.value;
}

    handleClick(){
        parse({loc:this.locationval}).then(result=>{
            console.log('result is',result);
            console.log('coooo1',result.current.condition.icon);
    this.imglink = result.current.condition.icon;
        }).catch(error=>{
            console.log('teststts'+error);
        })
    }
}