trigger callingwithshaering on Account (before insert,after insert,after update) {

    
    
    
    if(trigger.isafter && trigger.isupdate)
    { 
        try{
     list<account> accee = [SELECT Id, Name, Phone,(SELECT Id, LastName  FROM Account.Contacts) FROM Account where id = '001J4000004ZgbDIAS' with  SECURITY_ENFORCED  ];
        system.debug('acceee==>>'+accee);
        }
        catch(exception ee)
        {
            system.debug('test accesss '+ee.getmessage()+ee.getcause());
        }
        list<id> acc = new list<id>{'001J4000004ZgbDIAS','001J4000004ZgIqIAK'};
        List<Account> accountsWithContacts =
    [SELECT Id, Name, Phone,
        (SELECT Id, LastName, Phone,check_today_birthday_or_not__c,finacialyearcheck__c FROM Account.Contacts)
    FROM Account where id in : acc];
  
   // Strip fields that are not readable
   SObjectAccessDecision decision = Security.stripInaccessible(
                                       AccessType.READABLE,
                                       accountsWithContacts);
 
// Print stripped records
   for (Integer i = 0; i < accountsWithContacts.size(); i++) 
  {
      System.debug('Insecure record access: '+accountsWithContacts[i]);
      System.debug('Secure record access: '+decision.getRecords()[i]);
   }
 
// Print modified indexes
   System.debug('Records modified by stripInaccessible: '+decision.getModifiedIndexes());
 
// Print removed fields
   System.debug('Fields removed by stripInaccessible: '+decision);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate))
    {
     /*   withsharinginnerclAss.sharingg mm = new withsharinginnerclAss.sharingg();
        integer totalcount = mm.outerclasstesting();
        system.debug('total count ===>'+totalcount);
        
        system.debug('total count in outer methd ==>'+withsharinginnerclAss.outerclasstesting22());*/
   /*     list<id> acc = new list<id>{'001J4000004ZgbDIAS','001J4000004ZgIqIAK'};
        List<Account> accountsWithContacts =[SELECT Id, Name, Phone,(SELECT Id, LastName, Phone,LeadSource FROM Contacts) FROM Account where id in :acc ];
  
   // Strip fields that are not readable
   SObjectAccessDecision decision = Security.stripInaccessible(AccessType.updatable,accountsWithContacts);
           for (Integer i = 0; i < accountsWithContacts.size(); i++) 
  {
      System.debug('Insecure record access: '+accountsWithContacts[i]);
      System.debug('Secure record access: '+decision.getRecords()[i]);
   }
        for(account acc1 : accountsWithContacts)
        {
            system.debug(acc1.contacts);
        }
         System.debug('Fields removed by stripInaccessible: '+decision.getRemovedFields());
 */
     /*   system.debug('enteredor not');
           case mm = new case();
        mm.Status = 'new';
        mm.Origin = 'phone';
        mm.current_approver__c = 'database insert';
        list<case> cc = new list<case>();
        set<id> ss = new set<id>{'500J4000000tnF6IAI','500J4000000tnDPIAY','500J4000000thX0IAI','500J4000000tht0IAA','500J4000000thrxIAA'};
        list<case> cs = [select id,status,Description from case where id in :ss];
        for(case dd : cs)
        {
            dd.Description = 'update via strip inaccessible  with neoo######## accesss ';
        }
        cc.add(mm);
        try{*/
       // Database.insert(mm, AccessLevel.USER_MODE);
    //  insert as user mm;
         /*    SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE,cc );
    System.debug('---ecurityDecision.getRecords()->'+securityDecision.getRecords());
            if(restrictsubmitterhandler.futureOnce){
                restrictsubmitterhandler.futureOnce = false;
    insert securityDecision.getRecords();
                System.debug('removed  fields@@@'+securityDecision.getRemovedFields());}*/
                //********//
           /*     SObjectAccessDecision securityDecisionupdate = Security.stripInaccessible(AccessType.CREATABLE,cs );
    System.debug('---ecurityDecision.getRecords()->updated!!!!!'+securityDecisionupdate.getRecords());
          //  if(restrictsubmitterhandler.futureOnce){
              //  restrictsubmitterhandler.futureOnce = false;
    update  securityDecisionupdate.getRecords();
  System.debug('removed  fields@@@ updated@@@@@@@'+securityDecisionupdate.getRemovedFields());*/
       //     }
     /*       }
            
        catch (exception ee)
        {
            system.debug( 'eception mesggggg'+ee.getmessage()+ ee.getCause() );
        }*/
    }
    
}