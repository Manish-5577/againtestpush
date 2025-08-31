({
    invoke1 : function(component,event, helper) {
        alert('source2');
   /// event.stopPropagation() ; 
   /*    event.pause();
       window.setTimeout(
     $A.getCallback(function() {
         event.resume();
     }), 5
);*/
    }
   
})