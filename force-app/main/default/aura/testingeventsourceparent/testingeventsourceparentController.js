({
	invoke : function(component, event, helper) {
		var name =  event.getParam("test1");
      
     //   component.set("v.myName",name);
        console.log(name);
        component.find("ff1").set("v.value",name);
       
	}
})