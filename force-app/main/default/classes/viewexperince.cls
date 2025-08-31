public class viewexperince {

    @AuraEnabled
   
    public static list<Car_Experience__c> getexperince(string cardid)
    {
        return [select id,experience__c,Name,CreatedDate,lastmodifieddate,CreatedBy.Name,CreatedBy.SmallPhotoUrl,CreatedBy.CompanyName from Car_Experience__c where car__c =:cardid order by createddate desc];
    }
}