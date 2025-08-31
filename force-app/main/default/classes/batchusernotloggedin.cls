public class batchusernotloggedin implements database.batchable<sobject> {

    public database.querylocator start(database.batchablecontext bc)
    {
        return database.getquerylocator('select id,lastlogindate,name,managerid,email from user where id = \'0055j00000CofhdAAB\' ');
    }
    public void execute (database.batchablecontext bc , list<user> uu)
    {
         list<messaging.singleemailmessage> mm1 = new list<messaging.singleemailmessage>();
        for(user u : uu)
        {
        //    datetime dd = u.lastlogindate - ;
            Date lastlogindates = Date.newInstance(u.lastlogindate.year(), u.lastlogindate.month(),u.lastlogindate.day());
System.debug('Print Date:' + lastlogindates);
           system.debug(u.name);
           Integer numberDaysDue = lastlogindates.daysBetween(system.today());
            system.debug('numberdaydue'+numberDaysDue);
            if(numberDaysDue >=30)
            {
                messaging.singleemailmessage mm = new  messaging.singleemailmessage();
                mm.toAddresses= new list<string>{u.Email};
                mm.plaintextbody = 'abc user last login test';
                mm.subject = 'huree!!!!!!!';
                mm1.add(mm);
            }
                    }
         Messaging.sendEmail(mm1);
    }
    public void finish(database.batchablecontext bc )
    {

    }
    
}