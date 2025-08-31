import { LightningElement,wire,track } from 'lwc';
import getsingleaccount from '@salesforce/apex/allaccount2.getsingleaccount';
import getbulkcontact  from '@salesforce/apex/allaccount2.getbulkcontact'        
export default class Launchingflowfromlwc22 extends LightningElement {
    
  @track  singlecontact;
  @track  bulkcontact;
   @track
  inputVariables = [];
flowApiName ='launchingflow_from_lwc2';
    connectedCallback() {
        //code
        getsingleaccount().then((data)=>{
            console.log('test data');
 console.log(data);
 this.inputVariables = [
  {
			name: "contactrecord",
			type: "SOBJECT",
			value: data,  
		}
 ]


        }).catch((error)=>{
 console.log('error==>'+error);
        })

        getbulkcontact().then((data)=>{

               console.log('data 2222@@'+JSON.stringify(data));
               this.inputVariables.push({
                
           name: "contactrecordbulk",
			type: "SOBJECT",
			value: data,   
        
               })
        }).catch((error)=>{
                 console.log('error in bulk call'+JSON.stringify(error));
        })
    }
    // get inputvariables()
    // {
    //     return [
    //         {
	// 		name: "contactrecord",
	// 		type: "SOBJECT",
	// 		value: this.singlecontact,  
	// 	},
    //      {
	// 		name: "contactrecordbulk",
	// 		type: "SOBJECT",
	// 		value: this.bulkcontact,  
	// 	}
    //     ]
    // }

    handleFlowStatusChange(event)
    {
        console.log('what is event ');
		console.log(event)
		console.log("flow status", event.detail.status);
		if (event.detail.status === "FINISHED") {
            console.log('testing output variable@@@');
            console.log(event.detail.outputVariables);
			
		}
    }
}