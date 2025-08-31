public with sharing class  sharingtesting {

   
    @Auraenabled(cacheable=true)
    public static list<account> returnacc()
    {
       return [select id,securitycheck__c from account  order by createddate desc limit 10];
    }
    
    @auraenabled(cacheable = true)
          public static list<account> useofstripinaccessible()
          {
              try{
             
            list<account> acc = [select id,securitycheck__c,stage__c from account order by createddate desc limit 10 ];
              SobjectAccessDecision  decition  = security.stripinaccessible(AccessType.READABLE,acc);
                 System.debug('remove fields===>'+decition.getRemovedfields());
               //   System.debug(decition.getRemovedFields().get('Contact'));
              /*    account acc1 = (account)decition.getRecords()[0];
                  Boolean value = acc1.isSet('securitycheck__c');
                  System.debug('value ==>'+value);
                   Boolean value2 = acc1.isSet('Id');
                   System.debug('value22===>'+value2);*/
              return  decition.getRecords();
              }
              catch(queryException ee)
              {
                    throw new aurahandledexception('error message : '+ ee.getMessage());
              }
          }
    @future
    public static void  createelead(string lastname, string firstname, string phone , string company, string email)
    {  
         string ids ;
        try{
       List<lead> le = new list<lead>();
           lead ll = new lead();
                 ll.firstname = firstname;
         ll.lastname = lastname;
        ll.phone = phone;
        ll.company = company;
        ll.email = email;
            le.add(ll);
          //  insert ll;
        insert as user ll; 
            SObjectAccessDecision securityDecision =  Security.stripInaccessible(AccessType.CREATABLE, le);
      //  insert securityDecision.getRecords()[0];
            ids = ' succesfully  lead created with id strip check :::::>';
        }
          catch(exception cc){
         ids = 'error occured due to this::::>'+cc.getMessage();
     }
          // return ids;
    }

}