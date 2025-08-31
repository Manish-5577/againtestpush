public class CustomIterable implements Iterable<account> {
   public Iterator<Account> iterator(){
      List<Account> accounts =
      [SELECT Id, Name,
       NumberOfEmployees 
       FROM Account
       LIMIT 500];
       system.debug('what iterable rteurn ==>'+new CustomIterator(accounts));
      
      return new CustomIterator(accounts);
   }
}