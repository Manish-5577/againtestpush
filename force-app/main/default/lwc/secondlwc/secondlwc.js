import { LightningElement,track} from 'lwc';

export default class Secondlwc extends LightningElement {


 @track name ={
    name :"mani",
    age :9494
 };
changeWord(event){
    this.name.age = event.target.value;
}


}