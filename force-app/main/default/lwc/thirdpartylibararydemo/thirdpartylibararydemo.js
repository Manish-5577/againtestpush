import { LightningElement } from 'lwc';
import animate22 from '@salesforce/resourceUrl/animate22';
// import {loadStyle,loadScript} from 'lightning/platformResourceLoader';
import  thirdjs from '@salesforce/resourceUrl/thirdpartyjs';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
export default class Thirdpartylibararydemo extends LightningElement {
  displaydate = ''
  abc = 'manuuuuu';
   renddder = false

   connectedCallback()
   { console.log('ooooooooooooooooooooooooo');
    loadStyle(this,animate22).then(()=>{ 
        console.log('file loaded succesfully '+animate22);
    }).catch((error)=>{
        console.log('error occurred !!!!');
        console.log(error);
    })
    this.renddder =  true; 
    loadScript(this,thirdjs).then(()=>{
              this.displaydate = moment().format('llll');
    })
   }
    renderedCallback()
    {
      /*  if(!this.renddder){
        loadStyle(this,animate22).then(()=>{ 
            console.log('file loaded succesfully '+animate22);
        }).catch((error)=>{
            console.log('error occurred !!!!');
            console.log(error);
        })
        this.renddder =  true; 
        loadScript(this,thirdjs).then(()=>{
                  this.displaydate = moment().format('llll');
        })
    }*/
    }
}