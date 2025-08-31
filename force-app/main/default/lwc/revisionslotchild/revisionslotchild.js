import { LightningElement } from 'lwc';


export default class Revisionslotchild extends LightningElement {

// Note below query help u out to find element pressent in slot of child
// here we have not used this.template.querySelector() because this.template.queryslector work  only ==>
// for those element which r part of current component but in slot we r passing element from parent
//hence we use this.queryselector instead of this.template.queryselector

    renderedCallback() {
        console.log(this.querySelector("lightning-button")); // <span>push the green button.</span>
        console.log(this.querySelectorAll("lightning-button")); 
        console.log('differece !!$$#@@##')
        console.log(this.template.querySelector("lightning-button"))
        this.querySelector("lightning-button").className="adddedded!!!!"// [<span>push the green button</span>, <span>push the red button</span>]
      }
    }