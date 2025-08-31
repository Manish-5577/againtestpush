import { LightningElement } from 'lwc';
import countacount from '@salesforce/apex/inheritedsharing.countacount';
import outerclasstesting from '@salesforce/apex/withsharinginnerclAss.outerclasstesting';
import callinginheritedss from '@salesforce/apex/callinginherited.callinginheritedss';

export default class Inheritedsharing extends LightningElement {

connectedCallback()
{
    countacount().then(response=>{
        console.log('responsee'+response);
    }).catch(error=>
    {
        console.log('error');
    })

    outerclasstesting().then(responseouterclass=>{
        console.log('responseeouterclass'+responseouterclass);
    }).catch(error=>
    {
        console.log('error outerclass');
    })

    callinginheritedss().then(response=>{
        console.log('responsee part222'+response);
    }).catch(error=>
    {
        console.log(error);
        console.log('error part22'+error);
    })

}

}