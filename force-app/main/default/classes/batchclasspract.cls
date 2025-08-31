public class batchclasspract  implements database.Batchable<sobject>,schedulable{

   public void execute(schedulablecontext sc)
   {
       batchclasspract bcp = new batchclasspract();
       database.executebatch(bcp, 10);
       queuabltest qt = new queuabltest();
       system.enqueuejob(qt);
   }
    public class queuabltest implements Queueable
    {

        public void execute(queueablecontext qc)
        {
            system.debug('enqueue executed');
        }
    }
    public integer count =0;
    public database.querylocator start(database.BatchableContext  bb){
        string query = 'select id,name,(select id from contacts) from account order by createddate desc limit 1000';
        return database.getqueryLocator(query);
    }
    public void execute(database.BatchableContext bb,list<account> acc)
    {
        for(account ac : acc)
        {
            system.debug('!!!!!!!!!!'+ac.contacts);
        }
        system.enqueueJob( new queualble2());
        if(!acc.isEmpty())
        {
              List<database.Saveresult> deleteresultinfo = database.update(acc);
            for(database.Saveresult dd : deleteresultinfo){
                if(!dd.issuccess()){
                    list<database.error> errors = dd.geterrors();
                   
                }
            }
        }
    }
    
    public void finish(Database.BatchableContext bb){

         messaging.SingleEmailMessage mail = new    messaging.SingleEmailMessage();
        mail.setSubject('Batch processing completed');
        List<string> toadress = new list<string>();
        mail.setToAddresses(toadress);
        mail.setSenderDisplayName('manishtest');
        mail.setHtmlBody('delete event record using batch method ');
        List<messaging.SingleEmailMessage> emails = new List<messaging.SingleEmailMessage>();
        messaging.sendEmail(emails);
       
    }
}