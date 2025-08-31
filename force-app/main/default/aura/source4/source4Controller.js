({
	invoke6 : function(component, event, helper) {
     //   event.stopPropagation();  
        // event.stopPropagation() ; 
		alert('source4again???');
      //  event.stopPropagation();
	},
    	handleclcik : function(component, event, helper) {
		// var evt =component.getEvent("one");
              var appEvent = $A.get("e.c:testeventt");
        appEvent.fire(); 
       
           
	}
})