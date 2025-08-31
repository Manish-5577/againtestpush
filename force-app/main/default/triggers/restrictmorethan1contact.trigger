trigger restrictmorethan1contact on Contact (before insert) {

  
    if(trigger.isbefore && trigger.isInsert)
    {
        set<id> acctid = new set<id>();
    for(contact cc : trigger.new)
    {
        acctid.add(cc.accountid);
    }
        List<id> toinsert = new list<id>();
       
        Map<id,account>  accc = new map<id,account>([select id, (select id from contacts) from account where id in : acctid]);
        for(contact ss : trigger.new)
        {
            if(accc.get(ss.accountid).contacts.size()> 0)
            {
                ss.adderror('contact already exisit!!!!');
            }
            else if(toinsert.indexOf(ss.accountid) == -1) {
                toinsert.add(ss.AccountId);
            }
            else{
                ss.adderror('contact already exist  for your account');
            }
        }
    }
}