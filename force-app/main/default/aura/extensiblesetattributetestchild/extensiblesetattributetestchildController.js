({
	doInit : function(component, event, helper) {
		//component.set("v.address1","testtststt11t1tt1");  
		let currentUser = $A.get("$SObjectType.CurrentUser.Id");
        let currentUserprofile = $A.get("$SObjectType.CurrentUser.Profile")
alert('cuurentuse ==>'+currentUser);
        alert('currentUserprofile ==>'+currentUserprofile);
	},
    abc : function(component,event,helper)
    {
     var ff =    component.get("v.testvalue");
        component.set("v.whatwe",ff);
        
    }
})