trigger accountsecondary on Account (after insert,after update  ) {
  /*  list<accountshare> ccc = new list<accountshare>();
    if(trigger.isafter && trigger.isinsert)
    {
        for(account acc : trigger.new){
        accountshare acc1= new accountshare();
        acc1.AccountAccessLevel = 'edit';
        acc1.AccountId  = acc.id;
            acc1.OpportunityAccessLevel = 'edit';
            acc1.UserOrGroupId = '0055j00000CjojNAAR';
            ccc.add(acc1);
            
            }
        
    }else{
    system.debug('keyset'+trigger.oldmap.keyset());
   // list<testt__c> tt = [select id from testt__c where Accounttest__c in : trigger.oldmap.keyset()];
   system.debug('size==>'+[select id from testt__c where Accounttest__c in : trigger.oldmap.keyset()].size());
    delete [select id from testt__c where Accounttest__c in : trigger.oldmap.keyset()];
    }
    insert ccc;*/
  /*  if(   (trigger.isafter || trigger.isbefore)  && !(trigger.isdelete)  ){
         accountsecondaryowner asw = new accountsecondaryowner();
    asw.afterinsert(trigger.new,trigger.oldmap);
    }
        if(trigger.isbefore && trigger.isdelete){
       system.debug('trigger.old'+ trigger.old);
        system.debug('trigger.oldmap '+ trigger.oldmap);
        system.debug('trigger new'+ trigger.new);
            system.debug('trigger new map'+trigger.newmap) ;   }
        if(trigger.isafter && trigger.isdelete)
        {
            system.debug(' aftertrigger.old'+ trigger.old);
        system.debug('aftertrigger.oldmap '+ trigger.oldmap);
        system.debug(' after trigger new'+ trigger.new);
            system.debug('  acfter  trigger new map'+trigger.newmap) ; 
        }
    */
   
/*    map<id,id> mm = new map<id,id>();
    map<id,id> oldids = new map<id,id>();
    for(account acc : trigger.new)
    {
        if(!string.isblank(acc.secondary_owner__c)  )
        {
            if(trigger.old != null){
            if((acc.secondary_owner__c !=  (trigger.oldmap.get(acc.id).secondary_owner__c)))
            {
                oldids.put(acc.id,trigger.oldmap.get(acc.id).secondary_owner__c);
            }
            }
            mm.put(acc.id,acc.secondary_owner__c);
        }
    }

    list<accountshare> aacs =  new list<accountshare>();
    for(account acc : trigger.new)
    {
        accountshare acs = new accountshare();
        acs.AccountAccessLevel = 'READ';
        acs.OpportunityAccessLevel = 'READ';
        acs.ACCOUNTID = acc.Id;
        acs.UserOrGroupId = mm.get(acc.id);
        aacs.add(acs); 
    }*/
  /*  if(trigger.old != null)
    {
        list<accountshare> acc = [select id from accountshare where (ACCOUNTID in :oldids.keyset() and  UserOrGroupId in :oldids.values()) ];
        if(acc.size()>0)
        {
            delete acc;
        }
    }*/
  /*  try{
    if(aacs.size() > 0)
    {
        insert aacs;
    }
    }
    catch(exception ee)
    {
        system.debug('ee message ===>'+ee.getmessage());
        Error_log__c  hh = new Error_log__c();
        hh.objectname__c = 'accountmisue';
        hh.reason_for_error__c = 'erro failed'+ ee.getmessage();
        insert hh;
    }*/
    

}