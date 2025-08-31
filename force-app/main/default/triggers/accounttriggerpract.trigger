trigger accounttriggerpract on Account (before insert,after insert,after update) {

    
      if(trigger.isafter && trigger.isInsert)
      {
           handleraccountupdate.afterinsertcontact(trigger.new);
      }
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        handleraccountupdate.afterupdatecasefieldonaccoutn(trigger.new);
    }
    
}