trigger casetriggerpractise on Case (before insert,after insert,before update,after update,before delete ,after delete ) {

    
    if(trigger.isbefore && trigger.isInsert)
    {
        
         //    asetriggerhandlerclass.beforeinsert(trigger.new);
       
    }
    if(trigger.isafter && trigger.isinsert)
    {
       
      // asetriggerhandlerclass.afterinsertupdateaccount(trigger.new);
      //  asetriggerhandlerclass.afteupdatefieldtest(trigger.new);
    }
 /*  if(trigger.isafter && trigger.isinsert)
   {
       asetriggerhandlerclass.afteinsertfieldtest(trigger.new);
       
      
   }
     if(trigger.isafter && trigger.isupdate)
   {
       asetriggerhandlerclass.afterupdatefieldttest(trigger.new);
       
      
   }
      if(trigger.isafter && trigger.isupdate)
   {
       asetriggerhandlerclass.afterupdatefieldttest2(trigger.new);
   }
    if(trigger.isdelete &&  trigger.isbefore)
    {
          for(case ff : trigger.new)
          {
            //There's a problem saving this record. You might not have permission to edit it, or it might have been deleted or archived.
            // Contact your administrator for help.
          }
    //trigger.new is not allowed in before delete 
    //Note before delete mostly used for validation like whether user have authority to delete or not 
    }
    if(trigger.isdelete &&  trigger.isafter)
    {
          for(case ff : trigger.new)
          {
            ff.Type ='Mechanical';
          }
  // A runtime error is thrown. trigger.new is not available in after delete triggers.
    }*/
    if(trigger.isbefore && trigger.isupdate)
    {
      //  asetriggerhandlerclass.testfuturefromtrigger(trigger.newmap.keyset());
    }
    if(trigger.isafter && trigger.isinsert)
    {
   /*     case mm = new case();
        mm.Status = 'new';
        mm.Origin = 'phone';
        mm.current_approver__c = 'database insert';
        list<case> cc = new list<case>();
        cc.add(mm);
        try{
       // Database.insert(mm, AccessLevel.USER_MODE);
    //  insert as user mm;
             SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.UPDATABLE,cc );
    System.debug('---ecurityDecision.getRecords()->'+securityDecision.getRecords());
            if(restrictsubmitterhandler.futureOnce){
                restrictsubmitterhandler.futureOnce = false;
    insert securityDecision.getRecords();
  System.debug('removed  fields@@@'+securityDecision.getRemovedFields());
            }
        }
        catch (exception ee)
        {
            system.debug( 'eception mesggggg'+ee.getmessage()+ ee.getCause() );
        }
        */
    }
}