public class queuablecategory implements queueable{
    public integer mm = 1;
    public queuablecategory(integer nn)
    {
        this.mm = nn;
    }
    
    public void execute(queueablecontext qc )
    {
        if(mm < 4){
        batchaccountcategory bb = new batchaccountcategory();
        ID batchprocessid = Database.executeBatch(bb);
System.debug('Returned batch process ID: ' + batchProcessId);
        }
    }

}