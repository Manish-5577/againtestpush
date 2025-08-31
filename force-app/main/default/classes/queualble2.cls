public class queualble2  implements queueable{

    public void execute (QueueableContext context)
    {
        system.debug('queuable2');
         AsyncApexJob a = [SELECT Id, Status, NumberOfErrors
      FROM AsyncApexJob WHERE Id =
      :context.getJobId()];
        system.debug('lalallala');
        system.debug(a);
        futuretest.ttt();
            futuretest.ttt();
            futuretest.ttt();
            futuretest.ttt();
            futuretest.ttt();
       list<account> acc = [select id,name from account limit 15];
 // system.enqueueJob( new queuableclass(acc));
    //  system.enqueuejob(new queuable33(acc));
    }
}