({
	save : function(component, event, helper) {
		 component.find("recordLoader").get("e.recordSave").fire();
         
	},
    handlesuccess  :function(component, event, helper) {
		alert('record eedited successfullly ');
	}
})