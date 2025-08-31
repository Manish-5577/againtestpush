({
	invoke : function(component, event, helper) {
		var dd = event.getParam("greeting");
        alert('source2handler');
        component.set("v.receivedmssg",dd);
        event.stopPropagation();
    }
})