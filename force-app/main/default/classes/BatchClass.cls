public class BatchClass implements Database.Batchable<Account>{
   public Iterable<Account> start(Database.BatchableContext info){
       system.debug('new CustomIterable()==>'+new CustomIterable());
       for(integer i =0;i<1000000;i++)
       {
           
       }
       return new CustomIterable();
   }
   public void execute(Database.BatchableContext info, List<Account> scope){
       List<Account> accsToUpdate = new List<Account>();
       for(integer i =0;i<1000000;i++)
       {
           
       }
       for(Account acc : scope){
           acc.Name = 'changed';
           acc.NumberOfEmployees = 69;
           accsToUpdate.add(acc);
       }
       update accsToUpdate;
   }
   public void finish(Database.BatchableContext info){
   }
}