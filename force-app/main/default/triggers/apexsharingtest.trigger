trigger apexsharingtest on Lead (after update) {

    
    list<leadshare> sharelead = new list<leadshare>();
    for(lead ll : trigger.new)
    {
        if((ll.ownerid  != trigger.oldmap.get(ll.id).ownerid ) && ll.ownerid != null)
        {
            leadshare lol = new leadshare();
            lol.UserOrGroupId = trigger.oldmap.get(ll.id).ownerid;
            lol.LeadAccessLevel = 'EDIT';
            lol.LeadId = ll.id;
            sharelead.add(lol);
        }
    }
    if(sharelead.size() >0)
    {system.debug('llalalala');
    insert sharelead;
    }
    try{
    system.debug('insert as user previous line');
    Beer__c bb = new Beer__c();
    bb.brewery_Name__c = 'testing beer ';
    bb.Price__c = 11;
    insert as user  bb;
    system.debug('insert as user ');
    }
    catch(exception ee)
    {
        system.debug('reason for error!!!!!!!===>'+ ee.getmessage());
        system.debug('reason for error on line @@@@@==>'+ ee.getLineNumber());
    }
   
}