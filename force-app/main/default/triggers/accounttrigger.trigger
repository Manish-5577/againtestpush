trigger accounttrigger on Account (before insert) {
    
    for(account acc : trigger.new)
    {
        if(acc.rating == 'hot')
        {
            acc.adderror('hot is not allowed in before trigger');
        }
    }
    
/*map<id,contact> mm = new map<id,contact>();
    for(account acc : trigger.new)
    {
        contact cc = new contact();
        cc.lastname = acc.id + 'lastname';
        cc.email = acc.id+ '@gmail.com';
         mm.put(acc.id,cc);
    }
    
    insert mm.values();
    list<account> acctoUpdateList = new list<account>();
    for(account acc : [select id from account where id in : trigger.newmap.keyset()])
    {
        acc.Description = mm.get(acc.id).id + 'new contact id';
        acctoUpdateList.add(acc);
    }
    
    update acctoUpdateList;
    */
    
}