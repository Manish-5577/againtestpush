import { LightningElement,api,wire,track } from 'lwc';
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import getallaccount from '@salesforce/apex/allaccount2.getallaccount2';
import getsingleaccount from '@salesforce/apex/allaccount2.getsingleaccount';
export default class Callscreenflowfromlwcc extends LightningElement {
    flowApiName = "launching_screen_flow_from_lwc"; // api name of your flow
@api recordId ='00Q5j00000aLYb7EAG';
@track singleaccount ;
abcd =false;
abc = 9;
 accountrecordds  =[];
	// Setting flow input variables
   	recordname = '00Q5j00000aLYb7EAG'
	get flowInputVariables()
	{ return  [
		{
			name: "accountId",
			type: "String",
			value: this.recordname,
		},
		{
			name: "test1",
			type: "String",
			value: 'coool',
		},
		{
			name: "testcontact",
			type: "SObject",
			value: this.singleaccount,
		}
        
	];

	}
  @wire(getsingleaccount,{})
  wiretest({data,error})
  {
	if(data)
	{  console.log('datat==>'+JSON.stringify(data));
	             console.log(data);
                        this.singleaccount = data;
						this.abcd = true;
	}
	else if(error) {
       
	}
  }


    @wire(getallaccount,{num :'$abc'})
    abc({data,error})
    {
        console.log('wire approachh!!@@@')
    if(data)
    {   console.log('datat from woredd@@')
        this.accountrecordds = data;
       console.log(data);
    }
    else if(error)
    {console.log('erororor !!!')
        console.log(error);
    }
    }
        // do something when flow status changed
	handleFlowStatusChange(event) {
		console.log('what is event ');
		console.log(event)
		console.log("flow status", event.detail.status);
		if (event.detail.status === "FINISHED") {
            console.log('testing output variable@@@');
            console.log(event.detail.outputVariables);
			this.dispatchEvent(
				new ShowToastEvent({
					title: "Success",
					message: "Flow Finished Successfully",
					variant: "success",
				})
			);
		}
	}
}