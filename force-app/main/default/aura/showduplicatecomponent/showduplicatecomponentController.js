({
	doInit : function(component, event, helper) {
          component.set("v.duplicate",false);	
		 var recordidd = component.get("v.recordId");
         console.log('@@  line  55'+recordidd);
        var duplicate = component.get("c.duplicateLeads");
     //   duplicate.setParams({"recordId":recordidd});
        duplicate.setParam("recordId", recordidd);
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
        console.log('line 2999')
	},
    showduplicate :function(component, event, helper) {
         component.set("v.showduplicaterecord",true);
    },
    testgetcallback :function(component, event, helper) {
       
        window.setTimeout(
    setCallback(nn), 5000
);
        function nn(){
        alert('testt@@@😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎');
    }
        function mm()
        {
            alert('test223333333333333333');
        }
    //    alert('djjjjjjjjjjj');
 }
  
	
})