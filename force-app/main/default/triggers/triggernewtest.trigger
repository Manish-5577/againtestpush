trigger triggernewtest on Account (after insert,after update) {

 
    if(trigger.isafter) 
    {
        
        if(trigger.isinsert)
        {
             system.debug('trigger new map '+ trigger.newmap);
            system.debug('trigger new map key set'+ trigger.newmap.keyset());
           for(account acc : trigger.new)
           {
                 system.debug('trigger new map value based on key set'+ trigger.newmap.get(acc.id));               
           }
        }
        else if(trigger.isupdate)
        {
            for(account gg : trigger.new)
            {
                system.debug('in after update'+ trigger.newmap.get(gg.id));
            }
            
        }
    }
}