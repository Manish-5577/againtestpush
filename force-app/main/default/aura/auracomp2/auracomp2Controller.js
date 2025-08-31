({
	firee : function(component, event, helper) {
        
        
        /*	let b = component.find("abc").get("v.value");        
  console.log('jj===>'+b);
          var abc = component.getEvent("event2");
        //set the attribute valuesi
        abc.setParams({"datatransfer":b});
        // fire the event 
        abc.fire();*/
	
		var bb = event.getParam("datatransfer");
        console.log('what is bb==>'+bb);
        component.set("v.testt",bb);
        alert('!!!!!!!!!!!!!!!!! appliction event '+bb);
	},
    handlechange : function(cmp, event,helper)
    {
        let b = cmp.find("abc").get("v.value");        
  console.log('jj===>'+b);
          var abc = cmp.getEvent("event2");
        //set the attribute valuesi
        abc.setParams({"datatransfer":b});
        // fire the event 
        abc.fire();
    }
})