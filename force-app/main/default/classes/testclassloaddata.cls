@istest
public class testclassloaddata {

    @testSetup
    public static void tetet()
    {
         List < sObject > ls = Test.loadData(lead.sObjectType, 'testingloadd'); 
        lead c = (lead) ls[0]; 
        DateTime cDate = c.CreatedDate; 
        datetime modified = c.lastmodifieddate;
        System.debug('Case Date: ' + cDate);
         System.debug('Case Date: ' + modified);
    }
    @istest
    public static void hurerer()
    {
        list<lead> ll = [select id,lastmodifieddate,createddate  from lead ];
        update ll;
        system.debug('lastmodifieddate===>!!!!'+ll[0].lastmodifieddate);
    }
}