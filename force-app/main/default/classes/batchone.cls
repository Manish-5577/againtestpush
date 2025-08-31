public class batchone implements database.batchable<sobject> {

    
    public database.querylocator  start(database.batchablecontext  bc)
    {  system.debug('start transaction!!!!1');
        return database.getquerylocator('select id,(select id from contacts) from account');
    }
    
    public void execute(database.batchablecontext bcc, list<account> ac )
    {
        
    }
    public void finish(database.batchablecontext bb)
    {
        
    }
}