({
	handlessave : function(component, event, helper) {
        component.find("recordeditor").saveRecord($A.getCallback(function(response){
            if(response.state === "SUCCESS")
            {
                alert('reecord edited succesfullly'+response.recordId);
            }
            else if(response.state === "ERROR")
            {
                 alert('reecord edited succesfullly'+JSON.stringify(response.error));
            }
        }))
	}
})