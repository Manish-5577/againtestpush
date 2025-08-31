import { LightningElement,api } from 'lwc';

//import getauthorizationcode from '@salesforce/apex/Linkedinintegration.getauthorizationcode';
import { NavigationMixin } from 'lightning/navigation';

export default class LinkedinIntegration extends NavigationMixin(LightningElement) {


@api navigate;

    getauthorizationtoken(){
    /*    console.log('tettss');
        getauthorizationcode().then(resposnse=>{
     this.navigate = resposnse;
     console.log('this resposne',this.navigate);*/
    // window.location.href =  this.navigate;

     
        // Navigate to a URL
    /*    this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url:  this.navigate
            }
        },
        true // Replaces the current page in your browser history with the URL
      );

     
     }).catch(error =>{
            console.log('error reason is',error.body.message);
           
          
    })*/
}
}