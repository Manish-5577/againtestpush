public class asetriggerhandlerclass {

   
    public static void beforeinsert(list<case> cc)
    {
        for(case cc1 : cc)
        {
            if(cc1.Type == 'Mechanical')
            {
                cc1.Origin = 'Web';
            }
            
        }
    }
    public static void afterinsertupdateaccount(list<case> cc){
     Map<id,case> mapcase = new map<id,case>();
        List<account> updateacc = new list<account>();
      /*       for(case cc1 : cc) 
             {
                 if(!String.isBlank(cc1.AccountId ) ){
                 mapcase.put(cc1.AccountId,cc1);
                 }
             }
        for(account acc : [select id,latestcase_NoEmail_Field__c from account where id in : mapcase.keyset()])
        {
            acc.latestcase_NoEmail_Field__c = mapcase.get(acc.id).CaseNumber;
            updateacc.add(acc);
        }
        *********************  WRONG  APPROACH ******************************
        if(updateacc.size()>0)
        {
            update updateacc;
        }*/
        for(case cc1 : cc)
        {
            if(!String.isBlank(cc1.AccountId ))
               {
                   account acc = new account();
                   acc.id = cc1.AccountId;
                   acc.latestcase_NoEmail_Field__c = cc1.CaseNumber;
                   updateacc.add(acc);
               }
        }
               if(updateacc.size()>0)
        {
            update updateacc;
        }
    }
    
 /*   public static void afteinsertfieldtest(list<case> cc)
    {set<id> s = new set<id>();
        for(case ss : cc)
        {
           ss.type = 'Mechanical';
        //  s.add(ss.id);
        }
 //     when record is inserted in this case it will throw error like ' Record is read-only'
 
    }*/
 /*     public static void beforeupdtaefieldtest(list<case> cc)
    {set<id> s = new set<id>();
        for(case ss : cc)
        {
          // ss.type = 'Mechanical';
          s.add(ss.id);
        }
    list<case> sss = [select id,type from case where id in : s];
     for(case ss1 : sss)
     {
         ss1.Type = 'mechanical';
     }
     update sss;
     
     // Note if u r updating using dml in beforeupdate then ======> this error will come  therefore it cannot recursively update itself: []
    }*/
   /* public static void afterupdatefieldttest(list<case> cc)
    {
        set<id> s = new set<id>();
        for(case ss : cc)
        {
           ss.type = 'Mechanical';
       
        }
       
     //   this code will throw error ===>   System.FinalException: Record is read-only
    }*/
/*     public static void afterupdatefieldttest2(list<case> cc)
    {
        set<id> s = new set<id>();
        for(case ss : cc)
        {
          s.add(ss.id);
        }
          list<case> sss = [select id,type from case where id in : s];
     for(case ss1 : sss)
     {
         ss1.Type = 'mechanical';
     }
     update sss;
     //   this code will throw error ===>  first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY, casetriggerpractise: maximum trigger depth exceeded Case trigger event AfterUpdate Case trigger event
    }*/
  
    @future
    public static void testfuturefromtrigger(set<id>ss)
    {
        
    }
}