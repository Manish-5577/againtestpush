public class batchthree implements database.batchable<sobject> {

     public database.querylocator  start(database.batchablecontext  bc)
    {
        return database.getquerylocator('select id from opportunity limit 100');
    }
    
    public void execute(database.batchablecontext bcc, list<opportunity> ac )
    {
        
    }
    public void finish(database.batchablecontext bb)
    {
        
    }
}