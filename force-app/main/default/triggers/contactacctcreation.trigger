trigger contactacctcreation on Contact (after insert) {
map<id,account> mm = new map<id,account>();
    set<id> conid = new set<id>();
    for(contact cc : trigger.new)
    {
        account acc = new account();
        acc.name = cc.lastname;
        mm.put(cc.id,acc);
        conid.add(cc.id);
    }
    insert mm.values();
    list<contact> cctoupd = new list<contact>();
    for(contact cc : [select id,accountid from contact where id in : conid])
    {
       cc.accountid =  mm.get(cc.id).id;
        cctoupd.add(cc);
    }
    update cctoupd;
    
}