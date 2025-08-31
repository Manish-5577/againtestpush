import { LightningElement,wire,api } from 'lwc';
import getallaccount  from '@salesforce/apex/Allaccount.getallaccount'
export default class Wirefreshtesting extends LightningElement {

    @api childvariable  = 'thisvaluesassignedinchild';
connectedCallback()
{
    console.log('connected called'+this.childvariable)
    this.childvariable = 'passed from child conected'
}
constructor()
{  super();
    console.log('constructor called'+this.childvariable)
}
    @wire(getallaccount,{})
    storeaccount({data,error}){
        console.log('wire entered@@');
        if(data)
            {  console.log('entered')
                console.log(data)
            }
            else if(error)
                {
                    console.log('error occore');
                }
    }

}