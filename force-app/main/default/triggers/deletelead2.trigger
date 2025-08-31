trigger deletelead2 on Lead (after delete,before update,after update) {
if(trigger.isafter && trigger.isdelete){
    for(lead ff : trigger.old)
    {
        if(UserInfo.getFirstName() == 'manish')
        {
           // ff.adderror('ye nahi ho payega boss');
           system.debug('deleted id is ==>'+ff.id +'masterid ===>' + ff.MasterRecordId);
        }
    }
}
    if(trigger.isbefore && trigger.isupdate)
    {
        for(lead kk : trigger.new)
        {
            system.debug('updated id for merge operartion ==>'+kk.id);
        }
    }
    if(trigger.isafter && trigger.isupdate)
    {
        for(lead kk : trigger.new)
        {
            system.debug('updated id for merge operartion  after update ==>'+kk.id);
        }
    }
}