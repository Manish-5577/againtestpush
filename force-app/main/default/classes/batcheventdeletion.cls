public class batcheventdeletion implements database.Batchable<sobject>{

    Public static string ss;
    public static integer totalcount =0;
    public database.QueryLocator start(database.BatchableContext  bb){
        string query = 'select id,name from event__c where live__c = true and end_date_time__C < last_n_months:2';
        return database.getQueryLocator(query);
    }
    public void execute (database.BatchableContext bb, List<event__c> eventlist){
        if(!eventlist.isEmpty()){
            List<database.deleteResult> deleteresultinfo = database.delete(eventlist);
            for(database.deleteResult dd : deleteresultinfo){
                if(!dd.issuccess()){
                    list<database.error> errors = dd.geterrors();
                   
                }else{
                    totalcount++;
                }
            }
        }
    }
    
    public void finish(database.BatchableContext bb){
        ss = 'finish';
        messaging.SingleEmailMessage mail = new    messaging.SingleEmailMessage();
        mail.setSubject('Batch processing completed');
        List<string> toadress = new list<string>{'manishchaudhary19990@gmail.com'};
        mail.setToAddresses(toadress);
        mail.setSenderDisplayName('manishtest');
        mail.setHtmlBody('delete event record using batch method ');
        List<messaging.SingleEmailMessage> emails = new List<messaging.SingleEmailMessage>();
        messaging.sendEmail(emails);
    }
}