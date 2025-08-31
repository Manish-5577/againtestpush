import { LightningElement } from 'lwc';
import rendertest from './rendertest.html'
//import renderephasedemo3 from './renderephasedemo3.html';
export default class Renderephasdemoo2 extends LightningElement {

abc = true;
    // render()
    // {
    //     console.log('render comp neo');
    //     return owntemplate;
    // }
    renderedCallback()
    {
        console.log('renderededcallbackkk33k3k333k3k3');
    }
    checkrenderedhowmanytimefired(){
         this.abc = !this.abc;
    }
    handleClick(){
         this.abc = !this.abc;
    }
    render()
    { 
         if(this.abc)
         {
           
            return rendertest;
             // To reference CSS from an extra template, 
        // the CSS filename must match the filename of the extra template. 
        // For example, templateTwo.html can reference CSS only from templateTwo.css. 
        // It can’t reference CSS from miscMultipleTemplates.css or templateOne.css.
         }
       
    }
    
}