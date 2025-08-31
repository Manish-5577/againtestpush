import { LightningElement } from 'lwc';

export default class FETCHAPI extends LightningElement {

 returnip;


    Fetchapi()
    {
        // *******************            using promise apprach 
    // const calloutURI = 'https://api.ipify.org?format=json';
        // fetch(calloutURI, {
        //     method: "GET"
        // }).then((response) => response.json())
        //     .then(repos => {
        //         console.log(repos)
        //         this.returnip = repos.ip;
        //         console.log(this.myIp);
        //     });

        // &***********************  Using async await approach
        
    }

     async Fetchapi()
    {const calloutURI = 'https://api.ipify.org?format=json';
        const response = await fetch(calloutURI,{method :'GET'});
        const resp =  await response.json();
        if(response.ok){
            console.log('async awaiitt');
    this.returnip = resp.ip;
        }
    }

}