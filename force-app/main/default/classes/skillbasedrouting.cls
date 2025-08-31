public class skillbasedrouting {

       @invocableMethod
    public static void skillbase(list<id> caseId)
    {
        list<skill> skl = [select id,masterLabel,developername from skill ];
        for(case casrec : [select id,Subject from case where id in : caseId])
        {
            pendingServiceRouting psr = new pendingServiceRouting();
            psr.WorkItemId = casrec.Id;
            psr.Routingtype = 'SkillsBased';
            psr.RoutingPriority = 1;
           psr.CapacityWeight = 1;
            psr.ServiceChannelId ='0N9J4000000CaV9KAK';
            psr.RoutingModel = 'MOSTAvailable';
            psr.IsReadyForRouting = False;
            Insert psr;
        system.debug(psr);
        list<string> matchingskillids = new list<string>();
        for(skill sklrec : skl)
        {
            if(casrec.Subject.contains(sklrec.masterlabel)){
                matchingskillids.add(sklrec.id);
                system.debug(sklrec.id);
            }
        }
            pendingServiceRouting ss = [select id from pendingServiceRouting where id =: psr.Id ];
            list<skillRequirement>  skilltogetassociate = new list<skillRequirement>();
            for(string  skillids : matchingskillids)
            {
                skillRequirement skilreq = new skillRequirement();
                skilreq.SkillId =  skillids;
                skilreq.RelatedRecordId = ss.id;
               
                skilltogetassociate.add(skilreq);
                
            }
            insert skilltogetassociate;
            psr.IsReadyForRouting = true;
            update psr;
        }
        
    }
}