({
	sendmssg : function(component, event, helper) {
		var name = component.find("name").get("v.value");
        var dept = component.find("dept").get("v.value");
      var sal =  component.find("sal").get("v.value");
        alert('name'+name+'dept==>'+dept)
        var childcomp = component.find("child");
       var returnmessagess =  childcomp.callmethod(name.dept,sal);
       console.log('what returneded==>'+returnmessagess);
	},
      callAuraMethodServerTrip : function(component, event, helper) {
        var childCmp = component.find("child");
        // call the aura:method in the child component
        childCmp.echo(function(result) {
            console.log("callback for aura:method was executed");
            console.log("result: " + result);
        });
    },
})