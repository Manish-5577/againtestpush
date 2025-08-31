import { LightningElement,api,track } from 'lwc';

export default class Revision11 extends LightningElement {
    testvar;
   citylist = [{name:'pune',count:1},{name:'mumbai',count:2},{name:'nagpur',count:3},{name:'banglore',count:4}]
            @track check; @track tests;@track result; 
    @track name = {
        age : 98,
        avg : 13
    }
    chekit(event){
        console.log('c%%%^&&^&^76');
        this.name.age = event.target.value;
        this.name.avg = event.target.value;
        console.log('chekckckce');

        }

        Firstnos;secondnos;
        checkno(event)
        {
            if(event.target.name === 'firstno')
            {  // alert('3333');
               this.Firstnos = event.target.value;
                console.log('first no is '+event.target.value)
            }
            else if(event.target.name === 'secondno')
            {  //  alert('555533');
               this.secondnos = event.target.value;
                      console.log('second  no is '+event.target.value);
            
            }
        }
   add()
   {
           const mm = parseInt(this.Firstnos);
           const nn = parseInt(this.secondnos);
           this.result = `sum of two no is ${mm+nn}`
               
   }
   Subtract()
   {
    const mm = parseInt(this.Firstnos);
    const nn = parseInt(this.secondnos);
    this.result = `sum of two no is ${mm-nn}`
   }
   mult()
   {
    const mm = parseInt(this.Firstnos);
    const nn = parseInt(this.secondnos);
    this.result = `sum of two no is ${mm*nn}`
   }
   div()
   {
    const mm = parseInt(this.Firstnos);
    const nn = parseInt(this.secondnos);
    this.result = `sum of two no is ${mm/nn}`
   }

    
    test(event)
    {
        this.check = event.target.checked;
    }
    tracking(event)
    {
               this.testvar = event.target.value;
    }
   
}