public class schedyuleaprt3 implements  Schedulable {

      public void execute(schedulablecontext sc){
       //database.executebatch(new batchclasspract());
   //   testingscenarioo.testt();
   list<account> acc = [select id from account limit 100];
   system.enqueueJob( new queuableclass(acc));
      system.enqueuejob(new queuable33(acc));
    }

}