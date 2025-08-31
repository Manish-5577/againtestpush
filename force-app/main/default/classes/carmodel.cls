public class carmodel {

    
    @AuraEnabled(cacheable=true)
    public static list<Car__c>   getcarlist(string cartypeId){
        system.debug('cartypeId ====>'+cartypeId);
        if( cartypeId == '' || cartypeId == null ){
            return [select id,Contact__c,Contact__r.name,Available_For_Rent__c,Build_Year__c,Car_Type__c,Description__c,Geolocation__Latitude__s,Geolocation__Longitude__s,Geolocation__c,Mileage__c,Per_Day_Rent__c,Picture__c,Name from car__C where   Available_For_Rent__c= true];
        }
        else {
     
            return [select id,Contact__c,Contact__r.name,Available_For_Rent__c,Build_Year__c,Car_Type__c,Description__c,Geolocation__Latitude__s,Geolocation__Longitude__s,Geolocation__c,Mileage__c,Per_Day_Rent__c,Picture__c,Name from car__C where   Available_For_Rent__c= true  and  Car_Type__c =:cartypeId ];
 
        }
    }
}