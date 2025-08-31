trigger triggerscenarions on Account (before insert,after update) {

    set<id> accid = new set<id>();
    if(trigger.isafter && trigger.isupdate){
        for(account nn : trigger.new){
            
            accid.add(nn.Id);
        }
    }
    List<Opportunity> oppListToUpdate=new List<Opportunity>();
      List<Opportunity> oppListToUpdate2=new List<Opportunity>();
    list<opportunity> opp = [select id,name,Amount, CloseDate,AccountId,StageName from opportunity where AccountId in: accid];
    for(opportunity upp : opp){
        if((Date.today().daysBetween(upp.CloseDate)) >15  && upp.StageName != 'Closed Won'){
            system.debug('diff in date '+Date.today().daysBetween(upp.CloseDate));
            upp.StageName = 'closed Lost';
            oppListToUpdate.add(upp);
        }
    }
    if(oppListToUpdate.size()>0){
        update oppListToUpdate;
    }/* AggregateResult[] groupedResults
  = [SELECT sum(Amount)aver,avg(Amount) FROM Opportunity where accountid = '0015j000019aIGXAA2'];
system.debug('groupedResults'+groupedResults[0].get('expr0'));
system.debug('groupedResults'+groupedResults[0].get('aver'));
decimal mm = (decimal)groupedResults[0].get('aver');
system.debug('sum is s==>'+mm);
*/
  
        
    
    
}