trigger afterdeletedetailsobject on Account (after delete) {
set<id> acctid = new set<id>();
    for(account acc : trigger.old)
    {
        acctid.add(acc.id);
    }
 //   system.debug('hurreee!!!'+[select id from detailobject1__c where Account__c  in : acctid]);
 // delete [select id from detailobject1__c where Account__c  in : acctid];
}