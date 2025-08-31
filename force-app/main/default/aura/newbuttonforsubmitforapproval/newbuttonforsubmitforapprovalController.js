({

    doInit : function(component, event, helper) {
       console.log('recordid aura  is ==>'+component.get('v.recordId'));
		component.set("v.recordiid",component.get('v.recordId'));
        component.set("v.calllwc",true);
        
	}
})