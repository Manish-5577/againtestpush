public class allaccount2 {

    
      @AuraEnabled(cacheable =true)
    public static List<account> getallaccount2(integer num){
        
        list<case> cc = [select id,approval_status__c from case ];//this will not throw error
        
 //below line  will throw error 
 //Name,Phone,car__c,(select id,approval_status__c from cases)
       List<account> acc = [select id from account  with   security_enforced limit : num];
     //   list<account> ac = [select id from account limit 1];
      //  update ac;
        return acc;
    }
    @auraenabled
    public static list<account> getallaccounte()                              
    {
        integer j = 1;
    /*    account mm = [select id from account limit 1];
        mm.name = 'hhhupdated by apexx';
        update mm;*/
    /*    for(integer i =0;i<200000;i++)
        {
            system.debug('kkkkkk');
            j = i;
        }*/
        
      throw new aurahandledexception('hureeeeeeeeeeeeeee');
        
    }
    @auraenabled(cacheable =true)
    public static contact getsingleaccount()
    {
       return [select id,name from contact limit 1];
        
    }
     @auraenabled(cacheable =true)
    public static list<contact> getbulkcontact()
    {
       return [select id,name from contact limit 10];
        
    }
    
}