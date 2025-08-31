trigger aftertest on Account (before insert,after update) {

    
    if(trigger.isafter && trigger.isUpdate)
    {
        for(account dd : trigger.new)
        {
               if(dd.rating != trigger.oldMap.get(dd.id).rating)
               {   system.debug('rating new value is'+dd.rating);
                   system.debug('oldvalue is '+trigger.oldMap.get(dd.id).rating);
                   contact cc = new contact();
                   cc.accountid = dd.id;
                   cc.LastName = 'testafterupdatetrigger';
                   insert cc;
               }
        }
    }
}