trigger lastlogintest on User (before update,after update) {

  /* 
    for(user kk :trigger.new)
    {
        if(kk.LastLoginDate != Trigger.oldMap.get(kk.ID).LastLoginDate){
        
         kk.logincount__c = 89;
        }
    }
   */
}