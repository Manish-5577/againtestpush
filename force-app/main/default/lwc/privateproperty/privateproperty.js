import { LightningElement } from 'lwc';

export default class Privateproperty extends LightningElement {
    name;   // this is an private property it means till 2019 its values is not get changed on  call of below hhh event u have to use @track to make reactive
   fname;
    hhh(event){
        this.name= 'jjffjf';
        this.fname ='dkfjdksfjsldfsfjsfg';
    }
    get getusecase()
    {
       
        return this.fname;
    }
}