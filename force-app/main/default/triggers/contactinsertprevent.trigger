trigger contactinsertprevent on Contact (after insert) {
/*
    set<id> acctid = new set<id>();
    for(contact cc :trigger.new)
    {
        acctid.add(cc.accountid);
        
    }
  
  list<account> acc1 = new list<account>();
    map<id,account> mm = new map<id,account>([select id,(select id from contacts) from account where id in : acctid]);
    for(aggregateresult ag  : [select count(id)cc,accountid abc  from CONTACT where accountid in : acctid group by accountid])
    {
        account acc = new account();
        acc.id = (id)ag.get('abc');
        acc.account_notes__c = string.valueof(ag.get('cc'));
        acc1.add(acc);
    }
    
    update acc1;*/
  /*  for(contact gg : trigger.new)
    {
        if(mm.get(gg.accountid).contacts.size()> 0)
        {
            gg.adderror('contact delete');
        }
    }
    */
    
}