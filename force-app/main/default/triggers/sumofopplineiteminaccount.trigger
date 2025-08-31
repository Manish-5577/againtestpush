trigger sumofopplineiteminaccount on OpportunityLineItem (after insert) {

    set<id> oppid = new set<id>();
    for(OpportunityLineItem vv : trigger.new){
        
        oppid.add(vv.OpportunityId);
    }
    
    List<aggregateresult> agg = [select OpportunityId,sum(Quantity)su from OpportunityLineItem where OpportunityId in : oppid group by OpportunityId ];
    
}