public class batchtwo  implements database.batchable<sobject> {

    public database.querylocator  start(database.batchablecontext  bc)
    {
        return database.getquerylocator('select id from contact limit 500');
    }
    
    public void execute(database.batchablecontext bcc, list<contact> ac )
    {
      AsyncApexJob aspchild = [ select id,JobItemsProcessed, JobType, NumberOfErrors, ParentJobId, Status, TotalJobItems from AsyncApexJob  where id = : bcc.getChildJobId()];
        system.debug('child trandaction ==>'+aspchild);
          AsyncApexJob aspc = [ select id,JobItemsProcessed, JobType, NumberOfErrors, ParentJobId, Status, TotalJobItems from AsyncApexJob  where id = : bcc.getJobId()];
        system.debug('parent  trandaction ==>'+aspc);
    }
    public void finish(database.batchablecontext bb)
    {
        
    }
}