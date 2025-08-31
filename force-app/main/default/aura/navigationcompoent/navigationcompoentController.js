({
	onPageReferenceChange : function(component, event, helper) {
		var a_Page_Reference = component.get("v.pageReference");
      //  var a_Temp_Name = a_Page_Reference.state.p_Name;
        alert('page refrence test'+a_Page_Reference.state);
     //   component.set("v.a_Name", a_Temp_Name);
	},
    handleClick :function(component, event, helper) {
        alert('test!!');
         var navService = component.find("navService");
        // Sets the route to /lightning/o/Account/home
   /*     var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'
            }
        };*/
        var pageReference = {  
            type: "standard__component",
            attributes: {
                componentName: "c__callinglightningflwinaura"
            },
                }
        navService.navigate(pageReference);
         alert('test!!');
     //   component.set("v.pageReference", pageReference);
     /*   var relatedListEvent = $A.get("e.force:navigateToRelatedList");
    relatedListEvent.setParams({
        "relatedListId": "Cases",
        "parentRecordId": component.get("v.recordId")
    });
        
    relatedListEvent.fire();*/
     //   alert('record id ==>'+component.get("v.recordId"));
    }, 
    handlepaagereference :function(cmp, event, helper) {
          var navService = cmp.find("navService");
        // Sets the route to /lightning/o/Account/home
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'
            }
        };
        navService.navigate(pageReference);
    //   navService.navigate(pageReference);
        cmp.set("v.pageReference", pageReference);
        // Set the URL on the link or use the default if there's an error
        var defaultUrl = "#";
        navService.generateUrl(pageReference)
            .then((url) =>
                                 {
                alert('url==>'+url);
                cmp.set("v.url", url ? url : defaultUrl);
            }), $A.getCallback(function(error) {
                cmp.set("v.url", defaultUrl);
            });
    },
    handlePaste  :function(cmp, event, helper) {
      //   event.preventDefault();
    }
})