import { LightningElement,api,track,wire } from 'lwc';
import { fireEvent } from 'c/pubsub'; 
import {CurrentPageReference} from 'lightning/navigation'
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class Cartile extends LightningElement {

  @api cars;  @track classes ="tile";
@api selectedacaridtocartiles;


@wire(CurrentPageReference) pageRef;
  handletileclick(event){
    event.preventDefault();
    console.log('tttile');
    const carId  =  this.cars.Id;
    console.log('carid',carId);
   
    const eventt = new CustomEvent('selectedcartile',{detail:carId});
    this.dispatchEvent(eventt);
       console.log('this page ref===>'+JSON.stringify(this.pageRef));
    fireEvent(this.pageRef,'carselect',this.cars.Id);

  }
//   addborder(){
//     this.classes ="tile selected";
//   }
//   removeborder(){
//     this.classes ="tile";
//   }
 get getboundary(){
    console.log('lallatetststts');
    console.log('this.selectedacaridtocartiles',this.selectedacaridtocartiles);
    if(this.selectedacaridtocartiles === this.cars.Id){
        return "tile selected";
    }
    return "tile"
 }
}