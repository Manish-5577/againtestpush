public class fetchaccountrecord {

    @auraenabled 
     public static account  getaccount(string id){
        return [SELECT Id, IsDeleted, MasterRecordId, Name, Type, ParentId, BillingStreet, BillingCity, BillingState,
                BillingPostalCode, BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, 
                BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry,
                ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax,
                AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership,
                TickerSymbol, Description, Rating, Site, OwnerId, CreatedDate, CreatedById, LastModifiedDate,
                LastModifiedById, SystemModstamp, LastActivityDate, Active__c, testt__c, sumofopp__c, Contact__c,
                sumofopplineitem__c FROM Account where id =: id];
        
    }
    
    
}