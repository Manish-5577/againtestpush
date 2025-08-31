trigger opportunitystagetri on Opportunity (after update) {
set<id> ss = new set<id>();set<id> oppid = new set<id>();
    for(opportunity  opp :trigger.new)
    {
        if(opp.stagename == 'Closed/Won' && trigger.oldmap.get(opp.id).stagename != 'Closed/Won')
        {
            ss.add(opp.CreatedById);
        }
    }
 /*   list<detailobject1__share> obss = new list<detailobject1__share>();
    map<id,user> usermanger = new map<id,user>([select id,managerid from user where id in : ss]);
      for(opportunity op : [select id,(select id from detailobject1s__r) from opportunity where id in : oppid])
    {
        if(op.detailobject1s__r.size() > 0)
        {
            for(detailobject1__c jj :op.detailobject1s__r)
            {
               detailobject1__share obs = new detailobject1__share();
                obs.AccessLevel = 'Edit';
                obs.ParentID = op.Id;
                obs.UserOrGroupId =  usermanger.get(op.CreatedById).managerid;
               obss.add(obs);
            }
        }
    }
  */
    
}