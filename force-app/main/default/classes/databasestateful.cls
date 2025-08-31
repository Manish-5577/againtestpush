public class databasestateful  implements database.batchable<sobject>, database.stateful {

    public static  integer ccc = 3;
    public integer count = 0;
    public integer countfail = 0;
    public database.querylocator start(database.batchablecontext cc )
    {
        string queryy = 'select id,name from account  limit 50';
         queualble2 qq2 = new queualble2();
        system.enqueuejob(qq2);
 queualble2 qq23 = new queualble2();
        system.enqueuejob(qq23);
        return database.getquerylocator(queryy);
        
    }
    public void execute(database.batchablecontext ccc , list<account> scope)
    {
         queualble2 qq = new queualble2();
        system.enqueuejob(qq);
         queualble2 qq1 = new queualble2();
        system.enqueuejob(qq1);
        for(account acc : scope)
        {
            acc.name = acc.name + 'statefulupdate';
        }
        database.saveresult[] ds =  Database.update(scope,false);
    for(database.SaveResult d : ds){
        if(d.issuccess()){
            count++;
        }else{
            countfail++;
        }
        
    }
    }
    public void  finish (database.batchablecontext vd)
    {
       batchclassupdateaccount bca = new batchclassupdateaccount();
      database.executebatch(bca);
        batchclasspract bcp = new batchclasspract();
        database.executebatch(bcp);
        batchone bb = new batchone();
        database.executebatch(bb);
        batchtwo tt = new batchtwo();
        database.executebatch(tt);
        batchthree tr = new batchthree();
        database.executebatch(tr);
        batchfour bf = new batchfour();
        database.executebatch(bf);
        queualble2 qq = new queualble2();
        system.enqueuejob(qq);
     //   queualble2 qq1 = new queualble2();
     //   system.enqueuejob(qq1);
        system.debug('count size is '+count);
        system.debug('failure count is ==>'+countfail);
         AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :vd.getJobId()];
        system.debug('initial status'+a.status);
         messaging.SingleEmailMessage mail = new    messaging.SingleEmailMessage();
        mail.setSubject('Batch processing completed');
        List<string> toadress = new list<string>{'cpunaram35@gmail.com'};
        mail.setToAddresses(toadress);
        mail.setSenderDisplayName('manishtest');
        mail.setPlainTextBody('total of account updated are ===>'+count );
        List<messaging.SingleEmailMessage> emails = new List<messaging.SingleEmailMessage>();
        messaging.sendEmail(emails);
        ccc = count;
        system.debug('count size555 is '+count + '@@@'+ ccc);
    }
}