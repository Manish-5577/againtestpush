trigger updatedescforopportunity on Opportunity (before insert,before update ,after update,after insert) {

    if(trigger.isupdate && trigger.isbefore)
    {
    for(opportunity ss : trigger.new)
    {
        if(trigger.oldmap.get(ss.id).StageName != ss.stagename )
        {
            if(ss.stagename == 'Closed Lost')
            {
                ss.Description = 'closed lost opportunity';
            }
            else if(ss.stagename == 'Closed Won')
            {
                  ss.Description = 'closed won opportunity';
            }
        }
    }
    }
    if(trigger.isafter)
    {     
        if(trigger.isInsert ||  trigger.isUpdate)
        {set<id> ss = new set<id>();
            for(opportunity  opp : trigger.new)
            {
                //if(opp.amount != trigger.oldmap.get(opp.id).amount || trigger.oldmap == null)
              //  {
                    ss.add(opp.AccountId);
              //  }
            }
          list<account> acc= [select id,sumofopp__c,(select amount,accountid,id from opportunities) from account where id in : ss];
            for(account acc1 : acc)
            {  decimal amountsum = 0;
                if(acc1.opportunities.size()>0 )
                {
                    for(opportunity opp : acc1.opportunities){
                        if(opp.amount != null){
                        amountsum = amountsum  +  opp.amount;
                        }
                    }
                }
             acc1.sumofopp__c =  amountsum;
             system.debug('sum of opp ==>'+amountsum);
            }
            update acc;
        }
    }
    
}