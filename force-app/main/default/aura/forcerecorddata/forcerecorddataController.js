({
	myAction : function(component, event, helper) {
	/*	   var changeType = event.getParams().changeType;

    if (changeType === "ERROR") { 
       console.log('error')    
    }
    else if (changeType === "LOADED") { 
    console.log('loaded     @&&&&&&&&&&&&&&&&&&')}
    else if (changeType === "REMOVED") {  
    console.log('removed &&&&&&&&&&&&&&#########')}
    else if (changeType === "CHANGED") {
        console.log('changed       $$$$$$$$$$$%%%%%%%%%%')*/
      /* handle record change; reloadRecord will cause you to lose your current record, including any changes you’ve made */ 
   //  component.find("recordLoader").reloadRecord();
      //}
	},
    handlesave : function (component, event, helper)
    {alert('entered or not');
        component.find("recordLoader").saveRecord($A.getCallback(function(result)
                                                  {
                                                         if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                                                             component.set("v.getcallbackcheck",'updatedscueesfullt')
                alert("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                alert("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                alert('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
            } else {
                alert('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
                                                  }));
        alert('entered or not  part2 22');
    }
})