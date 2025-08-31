public class autonumberutilityqueuable implements queueable  {
    public integer retrialAttempt ;
    public List<sobject> ss ;
    public string objectapiname;
    public string fieldname ;
    public autonumberutilityqueuable(list<sobject> ss , string objectapiname, string fieldname, integer retrialattempt )
    {   this.retrialAttempt = retrialattempt;
        this.ss = ss;
        this.objectapiname = objectapiname;
        this.fieldname = fieldname;
    }
    public void execute(queueablecontext sc)
    {  system.debug('execute retrialAttempt==>'+retrialAttempt);
          if(retrialAttempt <= 3)
          { try{
            autonumberutility.optimiseAfterInsert(ss,fieldname,objectapiname ,retrialAttempt +1 );
          }catch(exception ee)
          {
                    if(ee.getMessage().contains('UNABLE_TO_LOCK_ROW'))
                    {
                        
                    }
          }
          }
    }
}