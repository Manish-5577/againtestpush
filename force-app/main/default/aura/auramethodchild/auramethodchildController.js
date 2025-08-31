({
	callaction : function(component, event, helper) {
		var ff = event.getParam("arguments");
        alert('ff.tempname==>'+ff.tempname +JSON.stringify(ff));
        component.set("v.empname",ff.tempname);
        component.set("v.empsal",ff.tempsal);
        component.set("v.empdept",ff.tempdept);
        for(let i =0;i<5000;i++)
        {
            console.log('test synchronous');
            if(i == 4999)
            {  
              return '999 index'
            }
        }
        return 'endtesting';
      
        
       
                      },
    callasynchronous : function(component, event, helper) {
         var duplicate = component.get("c.duplicateLeads");
     //   duplicate.setParams({"recordId":recordidd});
        duplicate.setParam("recordId", "00Q5j00000cmoREEAY");
        console.log('line  88');
          duplicate.setCallback(this,function(response){
            var state = response.getState();
              console.log('line 11'+state);
            if(state === 'SUCCESS')
            {
                var result =  response.getReturnValue();
                if(result.length >1){
                   // alert('duplicate exist  !!!!!!!!!!!');
                    component.set("v.duplicate",true);	
                }
                 console.log('tests'+result);
               component.set("v.childrecord",result);
                
               
                
            }else
            {
                console.log('jay shree ram  ');
            }
        });
          $A.enqueueAction(duplicate);
      
        
    },
    echo : function(cmp, event) {
        var params = event.getParam('arguments');
        var callback;
        if (params) {
            callback = params.callback;
        }

        var action = cmp.get("c.serverEcho");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("From server: " + response.getReturnValue());
                // return doesn't work for async server action call
                //return response.getReturnValue();
                // call the callback passed into aura:method
                if (callback) callback(response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                          errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
})