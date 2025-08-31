trigger trigggerpractisee on Account (before insert,after insert,before update,after update,before delete ,after delete) {
    
    
     if(trigger.isafter && trigger.isinsert){
        
   //     aftertriggerhandler.afterinsert(trigger.new);
 //  aftertriggerhandler.afterinsertneo(trigger.new);
    }
    if(trigger.isbefore && trigger.isinsert){

   ///    aftertriggerhandler.beforeinsert(trigger.new);
    }
     if(trigger.isbefore && trigger.isupdate){

  //     aftertriggerhandler.beforeupdate(trigger.new,trigger.old);
    }
     if(trigger.isafter && trigger.isupdate ){

      // aftertriggerhandler.afterupdate(trigger.new);
    }
    if(trigger.isafter && trigger.isdelete)
    {
        aftertriggerhandler.deletecheck(trigger.new);
    }

}