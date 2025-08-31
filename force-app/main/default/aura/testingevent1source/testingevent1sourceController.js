({
	handlechange : function(component, event, helper) {
		var ss = component.find("ff").get("v.value");
        console.log('ss ==>'+ss);
 /*       var abc = component.getEvent("firstcall");
        //set the attribute valuesi
        abc.setParams({"test1":ss});
        // fire the event 
        abc.fire();*/
        var evt = $A.get("e.c:testingevent");
        evt.setParams({"test1":ss});
        evt.fire();
	}
})