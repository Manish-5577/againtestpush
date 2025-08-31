public class queuableclass implements Queueable,Database.AllowsCallouts  {

    Public list<account> acc ;
    public  queuableclass(List<account> recieved)
    {
        this.acc = recieved;
    }
    
    public void execute(QueueableContext context)
    { List<account> processedd = acc;
        for(account acc1 : processedd)
        {
            acc1.name = 'updated by queueuable method';
        }
        Update processedd;
   //  queualble2 qq = new queualble2();
   //  system.enqueueJob( new queualble2());
    list<account> dd = [select id from account limit 10];
    // system.enqueueJob( new queuable33(dd));
  //   system.enqueueJob( new queualble2());
    }
}