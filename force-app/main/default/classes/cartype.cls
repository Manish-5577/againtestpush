public class cartype {

@AuraEnabled(cacheable=true)

    public static List<Car_Type__c> getCartype()
    {
        return [select Id,Name from Car_Type__c ];
    }
}