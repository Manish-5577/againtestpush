trigger opportunitytrigger on Opportunity (after update) {
    
     OpportunityTriggerHandler.setAccountOwner(Trigger.new, Trigger.oldMap);
 system.debug('trigger size opprotunity'+trigger.size);
}