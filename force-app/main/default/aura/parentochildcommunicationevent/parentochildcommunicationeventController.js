({
	call : function(component, event, helper) {
		 var evt = $A.get("e.c:eeparentochildcommunicationevent");
       
        evt.fire();
             alert('event fired or not ');
	},
    callnavigation : function(component, event, helper) {
	/* var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:navigationcompoent",
      
    });
    evt.fire();*/
      /*  var navService = component.find("navService");
        var pageRef = {
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Account",
                actionName: "new"
            },
            state: {
            }
	}
        navService.navigate(pageRef); 
      */
        
         }
})