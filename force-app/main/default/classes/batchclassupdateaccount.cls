public class batchclassupdateaccount  implements database.Batchable<sobject>,Database.stateful{

    public integer count =0;
    public integer failcount =0;
      public database.querylocator start(database.BatchableContext  bb){
        string query = 'select id,name from account order by createddate desc limit 1000';
        return database.getqueryLocator(query);
    }
    public void execute(database.BatchableContext bb,list<account> acc)
    {
        
        if(!acc.isempty()){
            for(account acc1 : acc)
            {
                acc1.name = 'batchupdat555s';
            }
            try{
              //  AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.EmailFROM AsyncApexJob WHERE Id =:bb.getJobId()];
               system.debug('job iddd ==>'+bb.getJobId());
             //   testst();
     /* update acc;
     
               count += acc.size();*/
             //   set<id> ss = new set<id>{'0015j000019aHiLAAU'};
                //     futuretestinf.ttt(ss);  
               // testst();
database.saveresult[] ds =  Database.update(acc,false);
    for(database.SaveResult d : ds){
        if(d.issuccess()){
           
            count++;
        }else{
            failcount++;
        }
        
    } 
             
}
catch(exception e){
system.debug('update failed'+e.getMessage()  + e.getCause() +    e.getLineNumber());
}
        }
     /*   if(!acc.isEmpty())
        {
              List<database.deleteResult> deleteresultinfo = database.update(acc);
            for(database.deleteResult dd : deleteresultinfo){
                if(!dd.issuccess()){
                    list<database.error> errors = dd.geterrors();
                   
                }
            }
        }*/
    }
    
    public void finish(Database.BatchableContext bb){
   ///     set<id> ss = new set<id>{'5005j00000vNeknAAC'};
      //   restrictsubmitterhandler.runinfuture(ss);
   // future method called
system.debug('count size is '+count);
        system.debug('failure count is ==>'+failcount);
         messaging.SingleEmailMessage mail = new    messaging.SingleEmailMessage();
        mail.setSubject('Batch processing completed');
        List<string> toadress = new list<string>{'manishchaudhary19990@gmail.com'};
        mail.setToAddresses(toadress);
        mail.setSenderDisplayName('manishtest');
        mail.setPlainTextBody('total of account updated are ===>'+count );
        List<messaging.SingleEmailMessage> emails = new List<messaging.SingleEmailMessage>();
        messaging.sendEmail(emails);
        system.debug('count size555 is '+count);
        
    }
    @future
    public static void testst(){
        system.debug('testtting');
    }
}