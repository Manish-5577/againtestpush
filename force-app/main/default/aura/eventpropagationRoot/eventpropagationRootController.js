({
	executevent : function(component, event, helper) {
		  // alert('i am in root component');
        var applievent = $A.get("e.c:eventpropagation");
        applievent.fire();
        alert('fired event');
	}
})