trigger opportunitycount on Opportunity (before insert) {
   /* 
    set<id> accidSet = new set<id>();
    for(opportunity opp : trigger.new){
        if(opp.accountid != null)
        {
        accidSet.add(opp.accountid);
        }
    }
    
    map<id,account> accOppMap  = new map<id,account>([select id, (select id,description from opportunities order by createddate desc )  from account where id in : accidSet]);
    map<id,string> accidOppCount = new map<id,string>();
    for(opportunity opp : trigger.new)
    {
        if(!accidOppCount.containskey(opp.accountid) )
        {
            if(accOppMap.get(opp.accountid).opportunities != null && accOppMap.get(opp.accountid).opportunities.size() > 0)
            {
                 integer oppSize = accOppMap.get(opp.accountid).opportunities.size() + 1;
                system.debug('lallala'+accOppMap.get(opp.accountid).opportunities[0].description);
                string one =  accOppMap.get(opp.accountid).opportunities[0].description + ',' + string.valueof(oppSize);
                opp.Description = one;
                accidOppCount.put(opp.accountid, one);
            }
            else{
                opp.Description = string.valueof(1);
                 accidOppCount.put(opp.accountid, '1');
            }

        }
        else{
            integer lengthh =   accidOppCount.get(opp.accountid).length();
                     string lastchar =    accidOppCount.get(opp.accountid).right(lengthh);
            opp.Description = accidOppCount.get(opp.accountid) +  ',' + ((integer.valueof(lastchar) + 1)) ;
            accidOppCount.put(opp.accountid,  opp.Description);
        }
            
    }
    
*/
}