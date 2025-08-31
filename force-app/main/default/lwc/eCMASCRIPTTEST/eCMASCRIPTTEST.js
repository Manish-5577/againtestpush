import { LightningElement } from 'lwc';

export default class ECMASCRIPTTEST extends LightningElement {

asynctest;

    connectedCallback()
    {
        function asynchronous_operational_method() {
            let first_promise = 
                new Promise((resolve, reject) => resolve("Hello"));
            let second_promise = 
                new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve(" GeeksforGeeks..");
                }, 1000);
            });
            let combined_promise = 
                Promise.all([first_promise, second_promise]);
            return combined_promise;
        }
        
        async function display() {
            let data = await asynchronous_operational_method();
           console.log('testing done')
            console.log(data);
        }
        
        display();
        
    }
}