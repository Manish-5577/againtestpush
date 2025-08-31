({
	doinit : function(component, event, helper) {
        alert('ddassssss@@@@@@@@@@@2');
		 var action=  component.get('c.calledbytrigger');  // Calling apex method
        
        action.setCallback(this,function(response)   // getting response back from apex method
        {
                  var state=response.getState();            // getting the state
        if(state==='SUCCESS')
        {
            alert('testtt'+response.getReturnValue());    // setting the value in attribute
           
        }
            else if (state==='Error')
            {
                alert('errror reason');
            }
                         
                         
        });
  $A.enqueueAction(action);

	}
})