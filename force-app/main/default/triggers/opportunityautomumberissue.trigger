trigger opportunityautomumberissue on Opportunity (before insert,after insert) {
    

 // autonumberutility.loadreferencedata();
 // autonumberutility.optimise(trigger.new,'name','Opportunity',0);
    
 
    if(trigger.isbefore && trigger.isinsert)
    {
   //     autonumberutility.optimise(trigger.new,'name', 'opportunity',0);
    }
    else if (trigger.isafter && trigger.isinsert)
    {
        autonumberutility.optimiseAfterInsert(trigger.new,'name', 'opportunity',0);
    }
   /* system.debug('trigger.size()==>'+trigger.size);
    integer abc = trigger.size;
   // opportunity opp = [select name from opportunity order by createddate desc limit 1 for update ];
    for(opportunity opp : trigger.new)
    {  integer count = abc++;
        opp.Name  = string.valueof(count);     
    }*/
    
}