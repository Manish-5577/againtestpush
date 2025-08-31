({
	handleChanged : function( cmp, message, helper) {
		
        if (message != null ) {
            console.log('mesga recieveed'+ JSON.stringify(message))
          console.log(message);
    }
        
	},
    handleClick :  function( cmp, message, helper) {
        
        const mssg ={
            auralms : 'hurre!!!',
            source : 'aura triggered'
        }
         cmp.find("sampleMessageChannel").publish(mssg)
    }
})