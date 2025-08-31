({
	sendmessage : function(component, event, helper) {
		  var evt = $A.get("e.c:evenapplitype");
        evt.setParams({"greeting":"Good Morning"});
        evt.fire();
        
	}
})