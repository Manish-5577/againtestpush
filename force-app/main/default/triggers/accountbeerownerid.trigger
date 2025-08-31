trigger accountbeerownerid on Account (after update) {
 system.debug('account trigger batch size()===>'+trigger.size);
//map<id,account> acciddata = new map<id,account>([select id,ownerid from account where id in : trigger.newmap.keyset()]);
map<id,id> acciddata= new map<id,id>();
    for(account acc : trigger.new)
    {  acciddata.put(acc.id, acc.ownerid);
     /*  if(acc.ownerid !=  trigger.oldmap.get(acc.id).ownerid)
        { 
             acciddata.put(acc.id, acc.ownerid);
        }
      */ 
    }
    list<beer__c> beerlist = new list<beer__c>();
    for(beer__c bb : [select id,ownerid,Account__c from beer__C where account__c in :  acciddata.keyset()])
    {
        bb.ownerid = acciddata.get(bb.Account__c);
        beerlist.add(bb);
    }
/*     if(beerlist.size()>0 )
    {
        update beerlist;
    }
*/
   if(beerlist.size()>0 && OpportunityTriggerHandler.isExecuted)
    {  OpportunityTriggerHandler.isExecuted  = false;
        update beerlist;
    }

}