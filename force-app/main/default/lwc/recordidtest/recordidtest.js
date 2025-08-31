import { LightningElement,api } from 'lwc';
export default class Recordidtest extends LightningElement {


@api recordId;
@api objectApiName;

connectedCallback() {
     console.log('reocrdId @@@'+this.recordId);
     console.log('objetcNameapiii'+ this.objectApiName);
}
constructor()
{
     super();
          console.log('reocrdId @@@ in construtor'+this.recordId);
     console.log('objetcNameapiii  in constrtuctor'+ this.objectApiName);
}

}