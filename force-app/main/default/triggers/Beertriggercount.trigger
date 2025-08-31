trigger Beertriggercount on Beer__c (after update ) {

    system.debug('trigger size   on beer  ===>'+ trigger.size);
    map<id,id> idownerid = new map<id,id>();
    for( Beer__c bb : trigger.new)
    {
        idownerid.put(bb.Account__c, bb.ownerid);
     /*   if(bb.ownerid  != trigger.oldmap.get(bb.id).ownerid)
        {
            idownerid.put(bb.Account__c, bb.ownerid);
        }
       */ 
    }
    list<account> aacc = new list<account>();
    for(account acc : [select id,ownerid from account where id in :idownerid.keyset() ])
    {
        if(idownerid.get(acc.id) != null)
        {
            acc.ownerid = idownerid.get(acc.id);
            aacc.add(acc);
        }
    }
    if(aacc.size() > 0  &&   OpportunityTriggerHandler.isExecuted)
    { OpportunityTriggerHandler.isExecuted = false;
        update aacc;
    }
   /*  if(aacc.size() > 0 )
    {
        update aacc;
    }*/
}