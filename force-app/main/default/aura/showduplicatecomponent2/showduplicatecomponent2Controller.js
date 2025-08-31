({
	doInit : function(component, event, helper) {
        component.set("v.jsonn",JSON.stringify(component.get("v.duplicaterecord")));
       var jj = component.get("v.jsonn");
        alert('&&&&&&'+jj);
	/*	  cmp.set('v.columns', [
            {label: 'Opportunity name', fieldName: 'opportunityName', type: 'text'},
            {label: 'Account name', fieldName: 'accountName', type: 'text'},
            {label: 'Close date', fieldName: 'closeDate', type: 'date'},
            {label: 'Confidence', fieldName: 'confidence', type: 'percentage'},
            {label: 'Amount', fieldName: 'amount', type: 'currency', typeAttributes: { currencyCode: 'EUR', maximumSignificantDigits: 5}},
            {label: 'Contact Email', fieldName: 'contact', type: 'email'},
            {label: 'Contact Phone', fieldName: 'phone', type: 'phone'},
            {label: 'Website', fieldName: 'website', type: 'url', typeAttributes: { target: '_self'}},
            {label: 'Address', fieldName: 'address', type: 'location'}
        ]);  */
       var jj = component.get("v.duplicaterecord");
        alert('testt'+JSON.stringify(jj)+'testdggjh');
      //  component.set("v.columns",jj);
        	  component.set('v.columns', [
            {label: 'Lead name', fieldName: 'Name', type: 'text'},
                   {label: 'Lead Phone', fieldName: 'Phone', type: 'text'},
                   {label: 'Lead Email', fieldName: 'Email', type: 'email'},
                  {label: 'Lead Email', fieldName: 'Id', type: 'email'}
                  
          
        ]);  
	}
})