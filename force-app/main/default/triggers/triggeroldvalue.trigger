trigger triggeroldvalue on Lead (before insert,before update,after insert , after update) {
    
    if(trigger.isbefore &&  trigger.isinsert)
    {
         for(lead ss : trigger.new)
    {
      //       System.debug('***SFDC: Trigger.old is before insert: ' + Trigger.oldmap.get(ss.id).email);
    //     System.debug('***SFDC: Trigger.old is before insert: ' + Trigger.old);
      //  System.debug('***SFDC: Trigger.new is: before insert newmap' + Trigger.newmap.get(ss.id).email);
     //   system.debug('email'+ss.email);
    //    system.debug('id===>'+ss.Id);
    //    System.debug('***SFDC: Trigger.new is: before insert' + Trigger.new);
    }
    }
   if(trigger.isbefore && trigger.isupdate)
   {
         for(lead ss : trigger.new)
    {
             System.debug('***SFDC: Trigger.old is: before update ' + Trigger.oldmap.get(ss.id).email);
        System.debug('***SFDC: Trigger.new is: before update ' + Trigger.newmap.get(ss.id).email);
    }
   }
    if(trigger.isafter && trigger.isinsert)
   {
      /*    for(lead ss : trigger.new)
    {
          //  System.debug('***SFDC: Trigger.old is: after insert ' +  Trigger.oldmap.get(ss.id).email);
        System.debug('***SFDC: Trigger.new is:  after insertt ' +  Trigger.newmap.get(ss.id).email);
         System.debug('***SFDC: Trigger.old is: after insert' +  Trigger.old);
         System.debug('***SFDC: Trigger.old is: after insert' +  Trigger.new);
    }*/
   }
    if(trigger.isafter && trigger.isupdate)
   {
        for(lead ss : trigger.new)
    {
             System.debug('***SFDC: Trigger.old is: after update ' + Trigger.oldmap.get(ss.id).email);
        System.debug('***SFDC: Trigger.new is: after update' +Trigger.newmap.get(ss.id).email);
    }
   }
    
   
       
    
    
}