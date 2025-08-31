({
	handleonready : function(component, event, helper) {
		const pubsuubmodule = component.find("pubsubname");
        alert('enter or not');
        const callbackfunctionss = $A.getCallback(function(anypayload){
            alert('payload===>'+anypayload);
             component.set("v.selectedmeetingroom",anypayload);
        })
        
      pubsuubmodule.registerListener('pubsubeg',callbackfunctionss);
	},
    doinit : function(component, event, helper)
    {
    alert('testing555555');
            },
    testing :function(component, event, helper)
    {
        const pubsuubmodule = component.find("pubsubname");
        pubsuubmodule.fireEvent('testaura','testmssg');
    },
    testauraa  : function(component, event, helper)
    {
        const pubsuubmodule = component.find("pubsubname2");
                const callbackfunctionss = $A.getCallback(function(anypayload){
            alert('payload===>'+anypayload);
             component.set("v.testfromaura",anypayload);
        })
        pubsuubmodule.registerListener('testaura',callbackfunctionss);
    },
})