public class queuable33 implements Queueable {
    
     Public list<account> acc ;
    public  queuable33(List<account> recieved)
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
     
  //   system.enqueueJob( new queualble2());
    }

}