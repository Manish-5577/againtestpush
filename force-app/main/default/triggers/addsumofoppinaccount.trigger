trigger addsumofoppinaccount on Account (before insert,after update,before update) {

    set<id> accid = new set<id>();
    if(trigger.isbefore && trigger.isupdate){
        for(account acc :trigger.new){
            accid.add(acc.id);
        }
    }
        Map<id,double> amount = new map<id,double>();
        List<aggregateresult> agg = [select AccountId,sum(Amount)TotalAmount from opportunity where AccountId in :accId group by accountid];
        if(agg.size()>0){
        for(aggregateresult jj : agg){
                id accountidd =  (Id)jj.get('AccountId');
            double ammount = (double)jj.get('TotalAmount');
            amount.put(accountidd,ammount);
        }
        }
        for(account m : trigger.new){
            if(amount.containskey(m.Id)){
                m.sumofopp__c = amount.get(m.id);
                system.debug('#######');
            }
        }
    
    
}