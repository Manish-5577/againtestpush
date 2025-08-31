@istest
public class testclassforautonumberutility {

    @testsetup
    public static void abc()
    {
        autonumberutility__c  anu = new autonumberutility__c();
        anu.Name = 'Business_Opportunity';
        anu.Format__c = 'BO';
        anu.Lastnumber__c = 0;
        anu.Length_of_AutoNumber__c = 6;
        anu.Object_APi_Name__c = 'Opportunity';
        anu.recordType__c ='Business_Opportunity';
        insert anu;
         autonumberutility__c  anu2 = new autonumberutility__c();
        anu2.Name = 'test2';
        anu2.Format__c = 'AC';
        anu2.Lastnumber__c = 0;
        anu2.Length_of_AutoNumber__c = 7;
        anu2.Object_APi_Name__c = 'Account';
        anu2.recordType__c ='test2';
        insert anu2;
    }
    
    
    
    @istest
    public static void test()
    {
        list<account> accList = new list<account>();
        list<opportunity> oppList = new list<opportunity>();
        for( integer i =0 ;i<250;i++)
        {
            account acc = new account();
            acc.rating = 'warm';
            acc.name = 'acc test'+i;
            accList.add(acc);
        }
        for(integer i =0;i<100;i++)
        {
            account acc = new account();
            acc.rating = 'warm';
            acc.name = 'acc name'+ i;
            acc.RecordTypeId = '0125j000001tlYGAAY';
            accList.add(acc);
        }
        for(integer i = 0;i< 300;i++)
        {         
           Opportunity opp = new Opportunity();
          opp.Name = 'Test Opportunity' + i;
           opp.StageName = 'Prospecting'; // Make sure this is a valid stage
          opp.CloseDate = Date.today().addDays(30); 
            opp.recordtypeid = '012J4000000btgTIAQ';
            opplist.add(opp);
        }
        for(integer i =0;i<210;i++)
        {
               Opportunity opp = new Opportunity();
          opp.Name = 'Test Opportunity' + i;
           opp.StageName = 'Prospecting'; // Make sure this is a valid stage
          opp.CloseDate = Date.today().addDays(30); 
            opplist.add(opp);
        }
        insert  accList;
        insert opplist;
        for(opportunity opp : [select id,name,recordTypeId from  opportunity  ])
        {
            system.debug('opp Name ==>'+opp.Name);
        }
        
    }
}