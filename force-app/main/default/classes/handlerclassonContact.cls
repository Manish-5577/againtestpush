public class handlerclassonContact {
    
    
    public static void updatenoofactivecontact(List<contact> cc)
    {set<id> ss = new set<id>();
     for(contact cc1 : cc)
     {   system.debug('do not call '+cc1.DoNotCall);
      if(cc1.DoNotCall == true )
      { 
          ss.add(cc1.accountid);
      }
     }
     
     list<account> acc = [select id,name,ActiveCountContact__c,(select id from contacts where donotcall = true) from account where id in : ss];
     for(account jjf : acc)
     {
         
         system.debug('jjf.contacts.size();===>'+jjf.contacts.size());
         jjf.ActiveCountContact__c = jjf.contacts.size();
         
     }
     
     if(acc.size()>0){
         update acc;
     }
    }
}