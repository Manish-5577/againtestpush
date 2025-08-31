import { LightningElement } from 'lwc';
import renderephasedemo2 from './renderephasedemo2.html';
import renderephasedemo3 from './renderephasedemo3.html';
export default class Renderephasedemo extends LightningElement {
    showTemplateOne = true;
    
    renderedCallback()
    {
        console.log('renderededcallackkk@@@@@@@');
    }
    render() {
        console.log('render howmany ')
        return this.showTemplateOne ? renderephasedemo2 : renderephasedemo3;
      }
    
      handleClick() {
        console.log('handleclickkk!!'+this.showTemplateOne);
        this.showTemplateOne = !this.showTemplateOne;
      }
}