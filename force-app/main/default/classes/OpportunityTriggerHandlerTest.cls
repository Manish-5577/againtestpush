@istest
public class OpportunityTriggerHandlerTest {
     @TestSetup
    public static void createData() {
        List<Account> accounts = new List<Account>();
        for(Integer i=1;i<=350;i++) {
            accounts.add(new Account(Name='Test Company'+i));
        }
        insert accounts;
        
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Integer i=1;i<=350;i++) {
            opportunities.add(new Opportunity(Name='Test Opportunity'+i, StageName='Prospecting', 
                                                  CloseDate=System.Today()+30, AccountId=accounts.get(i-1).Id));
        }
        insert opportunities;        
    }
    
    
    @IsTest
    public static void testUpdateOpptyOwner() {
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', UserName='standarr@testorg.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, TimeZoneSidKey='America/Los_Angeles');
        insert u;
        system.debug('testtt runnning');
        List<Opportunity> opportunities = [Select Id, AccountId, OwnerId from Opportunity];
        for(Opportunity oppty: opportunities) {
            oppty.OwnerId = u.Id;
        }        
        update opportunities;
        List<Account> accounts = [Select Id from Account Where OwnerId=:u.Id];
        list<opportunity> ooo = [select id,ownerid from opportunity ];
        for(opportunity ool :ooo)
        {   system.debug('ool iwnerid'+ool.OwnerId +'==>'+ u.Id);
             Assert.areEqual(u.Id, ool.ownerid);
        }
         Assert.areEqual(350, accounts.size());
        Assert.areEqual(350, accounts.size());
        
    }

}