({
	handleclcik : function(component, event, helper) {
		 var evt =component.getEvent("one");
        evt.fire(); 
        alert('parentnfire');
    },
    invoke11 : function(component, event, helper) {
		 var evt =component.getEvent("one");
      
        alert('source1');
    }
})