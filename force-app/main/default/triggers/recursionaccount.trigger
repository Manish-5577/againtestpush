trigger recursionaccount on Account (after update) {
AccountTriggerHandler.setOpportunityOwner(Trigger.newMap, Trigger.oldMap);
     system.debug('trigger size account'+trigger.size);

}