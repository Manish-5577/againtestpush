({
	handlechange : function(component, event, helper) {
		let b = component.find("abc").get("v.value");        
  console.log('jj===>!!!!!'+b);
        var evt = $A.get("e.c:auracomp1eve");
        evt.setParams({"datatransfer":b});
        evt.fire();
    /*     alert('is it fire!!');
        var abc = component.getEvent("event2");
        //set the attribute valuesi
        abc.setParams({"datatransfer":b});
        // fire the event 
        abc.fire();*/
        var action = component.get('c.abc');
        $A.enqueueAction(action);
	

	},
    firee : function (cmp,event,helper)
    {
        var bb = event.getParam("datatransfer");
        console.log('what is bb==>'+bb);
        cmp.set("v.testt",bb);
        alert('!!!!!!!!!!!!!!!!!'+bb);
    },
    abc : function (cmp,event,helper)
    {
        alert('method calleed!!');
    }
})