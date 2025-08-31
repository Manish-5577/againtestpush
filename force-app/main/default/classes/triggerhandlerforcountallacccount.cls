public with sharing class triggerhandlerforcountallacccount {
    
      @InvocableMethod(label='Insert Accounts' description='Inserts the accounts specified and returns the IDs of the new accounts.' category= 'Account')
    public static void accountcount1(list<account> acc2)
    { 
        system.debug('tetsting @@@@@@@@@');
        List<account> acc1 = [select id from account ];
        for(account avv : acc2)
        {
            if(acc1.size()>0)
            {       system.debug('acc1.size()'+acc1.size());
                avv.countofallaccount__c = acc1.size();
            }
        }
       
    }

    @auraenabled
    public static void accountcount(list<account> acc){
        List<Account> acc1 = [select id,name,countofallaccount__c from account ];
        if(acc.size()>0){
            for(account kk : acc){
                kk.countofallaccount__c = acc1.size();
            }
        }else {
            for(account kk1 : acc){
                kk1.countofallaccount__c =0;
            }
        }
       
    }
    @auraenabled
    public static List<account> getaccountsd()
    {
       list<account> accc =  [select id,name,industry,rating,stage__c,securitycheck__c  from account   order by createddate desc limit 20];
      sobjectAccessDecision  descc =   security.stripinaccessible(accessType.Readable,accc);
        system.debug('testtstts'+descc.getRemovedfields());// this will give inaccessible field name 
      account mm =  (account)descc.getRecords()[0];
      boolean value = mm.isSet('securitycheck__c');//output is false reason is user dont have access to this field
       boolean value2 = mm.isSet('name');//output is true reason is user have acces to this field 
        
      
        return descc.getRecords();
        
    }
}