trigger eventcapacityacccase on Case (after insert,before delete) {

    
    
    system.debug('idd oldmap'+trigger.oldmap.keyset());
    
   // map<id,account> acc = new map<id,account>([select id from account where id in : tr])
 /*  set<id> acctid = new set<id>();
    set<id> caseid = new  set<id>();
    FOR(case Kk : trigger.new)
    {
        acctid.add(kk.accountid);
        caseid.add(kk.id);
        system.debug('kk iid==>'+kk.id);
    }
    list<case> cc3 = [select id from case where id in :caseid ];
    system.debug('size()'+cc3.size());
    map<id,account> acc = new map<id,account>([select id,eventcapacity__c from account where id in : acctid]);map<id,integer> mm = new map<id,integer>();
    list<case> cc = new list<case>();
    for(account jj : acc.values())
    {
        mm.put(jj.id,integer.valueof(jj.eventcapacity__c));
    }*/
 /*   list<account> acctoupdate = new list<account>();
    list<case> cc1 = new list<case>();
        for(case hh : trigger.new)
    {
           if(hh.eventcapacity__c <= mm.get(hh.AccountId))
           {
               hh.eventstatus__c = 'confirmed';
               integer nn =  mm.get(hh.AccountId) - integer.valueof(hh.eventcapacity__c);
               mm.put(hh.AccountId,nn); 
            
           }
        else
        {
            hh.eventstatus__c = 'waiting';
          
        }
        
    }
    for(account agg : [select id from account where id in : mm.keyset()])
    {
        agg.eventcapacity__c = mm.get(agg.id);
        acctoupdate.add(agg);
    }
    update acctoupdate;
   */
}