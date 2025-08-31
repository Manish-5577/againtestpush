trigger countallaccount on Account (before insert,before update) {

   if(trigger.isbefore && trigger.isinsert)
   {nosharing.counttrigger22();
  triggerhandlerforcountallacccount.accountcount1(trigger.new);
   }
    if(trigger.isbefore && trigger.isupdate)
    {
        //nosharing.calledbytrigger(trigger.new);
        system.debug('test inherited');
   //  integer mm = inheritedsharing.countacount();
  integer mm =  callinginherited.callinginheritedss();  
        system.debug('mm acc size()'+mm);
    }
    
}