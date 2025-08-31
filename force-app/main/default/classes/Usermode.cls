public with sharing  class Usermode {
    @Auraenabled(cacheable=true)
    public static list<account> recordreturnwithusermode()
    {
       return [select id,securitycheck__c from account USER_MODE order by createddate desc limit 100];
    }
    
    @auraenabled(cacheable = true)
          public static list<account> useofusermode()
          {      
            list<account> acc = [select id,securitycheck__c,OwnerId	,Industry,phone from account where securitycheck__c != '' and industry != ''  with   USER_MODE   order by createddate desc limit 10];
              return acc;
     /*      
      try{
SobjectAccessDecision  decition  = security.stripinaccessible(accesstype.UPDATABLE,acc);
                 System.debug('remove fields===>'+decition.getRemovedfields());
                  account acc1 = (account)decition.getRecords()[0];
                  Boolean value = acc1.isSet('securitycheck__c');
                  System.debug('value ==>'+value);
                   Boolean value2 = acc1.isSet('Id');
                   System.debug('value22===>'+value2);
              return  decition.getRecords();
              }
              catch(queryException ee)
              {
                    throw new aurahandledexception('error message : '+ ee.getMessage());
              }*/
          }
    @auraenabled 
    public static void createrecord(string data){
       Account record = (Account)JSON.deserializeStrict(data, Account.class);
        try{
              insert as user record;
        }
        catch(queryException ee)
              {
                    throw new aurahandledexception('error message : '+ ee.getMessage());
              }
         
  
      //  database.insert(record,false);
    }
}