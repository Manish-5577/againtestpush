trigger opportunitypicklist on Opportunity (after update) {

    set<id> acctid = new set<id>();
    map<id,string> accidpicklist = new map<id,string>();
    for(opportunity opp : trigger.new)
    {
        if(opp.mulitplpicli__c != trigger.oldmap.get(opp.id).mulitplpicli__c)
        {
            accidpicklist.put(opp.accountid,opp.mulitplpicli__c);
        }
    }
    list<account> acc1 = new list<account>();
    for(account acc : [select id from account where id in : accidpicklist.keyset()])
    {  system.debug('accidpicklist.get(acc.id)==>'+accidpicklist.get(acc.id));
          acc.multiplepickli__c   = accidpicklist.get(acc.id);
          acc1.add(acc);
    }
    
    update acc1;
    
}