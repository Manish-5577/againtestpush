trigger addusertopublicgrp on User (before insert,before update,after insert , after update) {
              list<groupmember> grplist = new list<groupmember>();
    id grpid  = [select id from group where name = 'adminonly2'].id;
    if(trigger.isafter && trigger.isupdate){
    for(user ss : trigger.new)
    {
        if(ss.profile.name == 'System Administrator')
        {
            groupmember gg = new groupmember();
            gg.UserOrGroupId = ss.id;
            gg.GroupId = grpid;
            grplist.add(gg);
        }
    }
        if(grplist.size()>0)
        {System.debug('!!!!!!!!!!!!!!'+grplist[0].UserOrGroupId);
            insert grplist;
        }
    }
    
}