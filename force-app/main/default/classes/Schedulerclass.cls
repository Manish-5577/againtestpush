public class Schedulerclass implements Schedulable {

    public integer retrialAttempt ;
    public List<sobject> ss ;
    public string objectapiname;
    public string fieldname ;
    public  Schedulerclass(list<sobject> ss , string objectapiname, string fieldname, integer retrialattempt)
    {
        this.retrialAttempt = retrialattempt;
        this.ss = ss;
        this.objectapiname = objectapiname;
        this.fieldname = fieldname;
    }
    
    
    public void execute(schedulablecontext sc )
    {//  autonumberutilityqueuable abc = new autonumberutilityqueuable( ss , objectapiname,fieldname,retrialattempt);    
     //   system.enqueueJob(abc);
        system.debug('how many time scheduler fired');
        if( retrialAttempt < 3){
          autonumberutility.optimiseAfterInsert(ss,fieldname,objectapiname ,retrialAttempt+1 );
        }
    }
}