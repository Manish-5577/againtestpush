public class OpportunityTriggerHandler {
  public static boolean isExecuted = true;
    public boolean hh = false;                        
     public static void setAccountOwner(List<Opportunity> opportunities, Map<Id, Opportunity> oldMap) {
 
         
        List<Account> accounts = new List<Account>();
        for(Opportunity opportunity : opportunities) {
            system.debug(opportunity.ownerid + 'old ownerid==>' + oldMap.get(opportunity.Id).OwnerId  );
         //  if(opportunity.OwnerId != oldMap.get(opportunity.Id).OwnerId){
            accounts.add(new Account(Id=opportunity.AccountId, OwnerId=opportunity.OwnerId));
          // }
        }       
        update accounts;
              system.debug('opportunitoes updatedddd!!');
              
    
     } 
    
    
   
}