({
	searchPostal : function(component, event, helper) {
     /*        window.setTimeout(
     $A.getCallback(function() {
          helper.fetchpostaldata(component, helper,event)
     }), 1
);*/
         	var enteredpincode = component.get("v.enteredpin");
        var branchname = component.get("v.enteredBranch");
          component.set('v.columnlist', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'BranchType', fieldName: 'BranchType', type: 'text'},
            {label: 'DeliveryStatus', fieldName: 'DeliveryStatus', type: 'text'},
            {label: 'Circle', fieldName: 'Circle', type: 'text'},
            {label: 'District', fieldName: 'District', type: 'text'},
            {label: 'Division', fieldName: 'Division', type: 'text'},
            {label: 'Region', fieldName: 'Region', type: 'text'},
            {label: 'State', fieldName: 'State', type: 'text'},
               {label: 'Country', fieldName: 'Country', type: 'text'},
               {label: 'Pincode', fieldName: 'Pincode', type: 'text'}
        ]);
        
        if(enteredpincode){
              var abbb = component.get("c.getdataUsingPincodecode");
        abbb.setParams({"pincode":enteredpincode});
        }
        else if(branchname){
              var abbb = component.get("c.getdataUsingbranchname");
        abbb.setParams({"branchname":branchname});
        }
        abbb.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS')
            {    //alert('tets');
                var result =  response.getReturnValue();
                component.set("v.postalrecordlist",result);
                console.log(result);
            }else
            {
                console.log('jay shree ram  ');
            }
        });
    $A.enqueueAction(abbb);
        
        }
})