trigger testingdetailoperation on testing__c (before delete) {

    
     for(testing__c tt : trigger.old)
     {
         system.debug('in before delete parent id ' +tt.Account__c);
         
     }
    
}