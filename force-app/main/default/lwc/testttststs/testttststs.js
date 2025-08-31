import { LightningElement,track } from 'lwc';
import parse from '@salesforce/apex/praccurrency.parse';
const colum =[
    {label:"currency code",fieldName:"currencycode"},
    {label:"Value",fieldName:"currencyvalue"}
 
]
export default class Testttststs extends LightningElement {
    columns = colum;
@track datta;
@track finaldata =[];
@track testdat;
@track one =[];
@track two =[]

    handleClick(){
      parse().then(result=>{
        console.log(result);
        let mapp ={}
        for( let dd in result.rates){
          
            this.one.push(dd);
            this.two.push(result.rates[dd]);
            console.log('map keys ',dd);
            console.log('map values ',result.rates[dd]);
                 //mapp[dd]= result.rates[dd];
                 this.finaldata.push({key:dd,value:result.rates[dd]});
                 //this.finaldata.push(mapp);
                    console.log('test');
                  
        }  let i =0;
        this.finaldata.forEach((element,index)=>{
          console.log('finally ho gaya',JSON.stringify(element));
          // console.log('09999999999990909',index);
            // console.log('uuuuuuuuu',this.one[index]);
             //   console.log('final test ',this.finaldata[index][this.one[i]]);
                // let kk = this.one[i];
                // console.log('element===.>>',element[kk]);
               element.currencycode = element.key;
               element.currencyvalue =element.value;
                   i++;
                  console.log('i is ==>',i);
         })
         this.datta = this.finaldata;
    //     console.log('unique',this.one[89]);
    //     console.log('unique',this.two[89]);
    //    this.one.forEach(element => {
          // console.log('onenenen',element);
                    //    console.log('====>',this.finaldata[i][element]);
                    //   element.techo = this.finaldata[i][element];
                    //    element.techo2 = element;
                      
    //    });

    //    this.two.forEach(element => {
        
              //     console.log('two valuebis ===>',element)
                 //    element.techo2 = element;
                    // i++;
                
    // });
            
       
      //  console.log('keysssss s.length',keysss[i].length);
        // for(let i =0;i<keysss.length;i++){
        //     console.log('hhhhh',keysss[i]);
        // }
        // keysss.forEach(element=>{
        //     console.log('testtsts',element);
        //     element.techo = this.finaldata[element];
        // })
          //  console.log(JSON.stringify(this.finaldata[i]['GHS']));
        
        //console.log('mapp',mapp);
      }).catch(error=>{
        console.log('error reasin is ==>',error);
      })
    }
    clickaction(event){
             //console.log('event action is==>',event.target.value.two);
            
             let empName = document.getElementById('Label1').value;
             console.log('empname ',empName);
    }
}