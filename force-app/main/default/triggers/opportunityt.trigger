trigger opportunityt on Opportunity (before insert,before update,after update) {

    
    if(trigger.isupdate && trigger.isbefore)
    {
        for(opportunity op : trigger.new)
        {
            op.amount = 321132;
                       system.debug('opportunity update before trigger for product'+op.id);
        }
    }
     if(trigger.isinsert && trigger.isbefore)
    {
        for(opportunity op : trigger.new)
        {
                       system.debug('opportunity insert before trigger for product'+op.id);
        }
    }
     if(trigger.isupdate && trigger.isafter)
    {
        for(opportunity op : trigger.new)
        {
                       system.debug('opportunity after update  trigger for product');
        }
    }
}