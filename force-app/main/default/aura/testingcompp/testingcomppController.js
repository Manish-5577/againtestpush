({
	handlechange : function(component, event, helper) {
	let gg =	component.find("one").get("v.value");
        component.set("v.storestring",gg);
	}
})