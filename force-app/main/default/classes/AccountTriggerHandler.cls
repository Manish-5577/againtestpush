public class AccountTriggerHandler {
 public static boolean isExecuted = false;
    
    public static void setOpportunityOwner(Map<Id, Account> accounts, Map<Id, Account> oldMap) { 
        map<id,Opportunity> oppties = new map<id,opportunity>([Select Id, AccountId, OwnerId from Opportunity where AccountId in :accounts.keySet()]);
        system.debug('oppties==>'+oppties.size());
        map<id,opportunity> mm = new map<id,opportunity>();
       for(opportunity ii : oppties.values())
       {
           mm.put(ii.accountid, ii);
       }
            isExecuted = true;
        for(account acc : accounts.values()) {
            system.debug(acc.ownerid + 'old accountid==>'+ oldmap.get(acc.id).ownerid);
           // if(acc.ownerid != oldmap.get(acc.id).ownerid)
          //  {
                  mm.get(acc.id).ownerid = acc.ownerid;
         //   }
          
        }
        if(mm.values()  != null) {
            Database.update(mm.values(), false);
        }
         }
       
    
}