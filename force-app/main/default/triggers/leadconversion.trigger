trigger leadconversion on Lead (after update,before update) {

    for(lead ll : trigger.new)
    {
        if(ll.isconverted && ll.IsConverted != trigger.oldMap.get( ll.Id ).IsConverted)   
        {
            //ll.adderror('tetsttseroroor'+ll.isconverted +'jjj'+ trigger.oldMap.get( ll.Id ).IsConverted);
        }
    }
    Map<id,lead> mm = new Map<id,lead>();
   // list<id> accountid = new List<id>();
   
    for( lead ll : trigger.new)
    {
        if(ll.IsConverted && (trigger.oldmap.get(ll.id).isconverted != ll.IsConverted) )
        {
            if( ll.ConvertedOpportunityId != null)
            {
               
                mm.put(ll.id, ll);
            }
        }
    }list<opportunity> oppp = new List<opportunity> ();
 //   Map<id,opportunity> opp = new Map<id,opportunity>([select id,potential_amount__c from opportunity where id in : oppid]);
     for(lead ss : mm.values())
     {
         opportunity  op = new opportunity();
         op.id = ss.ConvertedOpportunityId;
         op.potential_amount__c = ss.potential_amount__c != null ?  ss.potential_amount__c : 0;
         oppp.add(op);
     }
    if(oppp.size()>0)
    {
        update oppp;
    }
    
}