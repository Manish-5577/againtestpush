({
	messageHandler : function(component, event, helper) {
		 if (
      event &&
      event.getParam("mssgtopassfrom3to1")
    ) {
      //  alert('what is event'+event);
      const msg = event.getParam("mssgtopassfrom3to1");
   //     alert('msg==>'+msg);
      const messages = component.get("v.messages");
            
      component.set("v.messages", msg);
    }
	}
})