trigger updatephoneoncontactviacacc on Account (before insert,after insert,after update) {

    set<id> ss = new set<id>();
    for(account acc :trigger.new)
    {
        if(acc.phone != Null){
            ss.add(acc.id);
        }
    }
    list<contact> cc = new List<contact>();
    List<account> acc = [select id,phone,(select id,phone from contacts) from account where id in : ss];
    for(account ss : acc)
    {
        for(contact jj : ss.contacts)
        {
            jj.phone = ss.phone;

        }
    }
  
}