public class batchfour implements database.batchable<sobject>{
    
    
        
          public database.querylocator  start(database.batchablecontext  bc)
    {
        return database.getquerylocator('select id from lead limit 100');
    }
    
    public void execute(database.batchablecontext bcc, list<lead> ac )
    {
        
    }
    public void finish(database.batchablecontext bb)
    {
        
    }

}