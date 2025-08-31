import { LightningElement } from 'lwc';

export default class Dommanupilation extends LightningElement {

     renderedCallback()
     {
        console.log(this.template.querySelector("div[slot=title]").textContent);
        this.template.querySelector("div[slot=title]").textContent = 'let change it ';// Card title changed to "let change it"
        console.log(this.template.querySelector(".second-class"));
        console.log(this.template.querySelector(".second-class").label);
        console.log(this.template.querySelector(".second-class").variant);
        this.template.querySelector('lightning-card').style.color='green';
        this.template.querySelector('lightning-card').classList.add('abc');
       
     }
    



}