({
	init : function(component, event, helper) {
       //  var flow = component.find("flowData");
        var flow = component.find("flowData1");
        var recordidd = component.get('v.recordId');
      
		 var inputVariables = [
                {
                    name : "RECRDID",
                    type : "String",
                    value: recordidd
                }
            ];

             // In the component whose aura:id is flowData, start your flow
             // and initialize the account record (sObject) variable. 
             // Reference the flow's API name.
         //   flow.startFlow("Calling_from_aura", inputVariables);Udemy_before_update
        flow.startFlow("Udemy_before_update");
	},
    handleStatusChange :function(component, event, helper) {
        console.log(event.getParam("status"));
        if(event.getParam("status") === "FINISHED") {
         // Get the output variables and iterate over them
         var outputVariables = event.getParam("outputVariables");
         var outputVar;
            alert('ttt');
            alert(JSON.stringify(outputVariables));
      /*   for(var i = 0; i < outputVariables.length; i++) {
            outputVar = outputVariables[i];
            // Pass the values to the component's attributes
            if(outputVar.name === "accountName") {
               component.set("v.accountName", outputVar.value);
            } else {
               component.set("v.numberOfEmployees", outputVar.value);
            }
         }
         */
      }

    }
})