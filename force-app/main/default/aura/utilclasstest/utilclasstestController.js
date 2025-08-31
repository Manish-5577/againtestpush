({
	addcolorclass : function(component, event, helper) {
		var myCmp = component.find("addcolor");
$A.util.addClass(myCmp, "myClass");
	},
    
    doInit :  function(component, event, helper) {
		console.log('init ==>');
	},
    
    doRender : function(component, event, helper) {
		console.log('rendered it  ==>');
	}

})