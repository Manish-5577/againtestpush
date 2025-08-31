trigger accountbeforeupdate on Account (before update) {
list<account> acc1 = new list<account>();
    for(account acc : trigger.new)
    {
        acc1.add(acc);
    }
    update acc1;
  /*  list<contact> cc1 = new list<contact>();
    for(contact cc : [select id,lastname from contact where accountid in : trigger.newmap.keyset()])
    {
         cc.lastname = 'updatedby before update';
         cc1.add(cc);
    }
    update cc1;*/
}