public with sharing class databasequery {

    @Auraenabled(Cacheable =true)
    public static list<sobject> getoppquotepricerecords(string query) 
    {
        try{
            system.debug('what is queryyy==>'+query);
            return Database.query(query);
        }
        catch(exception ee)
        {
            throw new AurahandledException(ee.getmessage());
        }
    }
    @Auraenabled(cacheable = true)
   public static list<sobject> getpricebookid(string query)
   {
       try{
           return database.query(query);
       }
        catch(exception ee)
        {
            throw new AurahandledException(ee.getmessage());
        }
   
   }
    @Auraenabled
    public static void updatepricebokid(string objectname,string recordid, string pricerecordid)
    {  
        try{
          sobject updatesobjectt = schema.getGlobalDescribe().get(objectname).newSobject();
                      updatesobjectt.put('Pricebook2Id',pricerecordid);
        updatesobjectt.put('Id',recordid);
        update updatesobjectt;
            }
        catch(exception ee)
        {  system.debug('what is price id'+pricerecordid);
              throw new AurahandledException(ee.getmessage());
        }
           
    }
    @Auraenabled(cacheable = true)
    public static list<sobject> pricebookenrty(string priceBook2Idd)
    {
        try{
            return [select id,isactive,UnitPrice,Product2Id,Pricebook2Id,Name from PricebookEntry where isactive = true and PriceBook2Id =:priceBook2Idd];
        }
        catch(exception ee)
        {
            throw new AurahandledException(ee.getmessage());
        }
    }
    
    
    @AuraEnabled
    public static void submitproduct(string objectApiName , string recordtoupsert)
    {   system.debug('recordtoupsert==>'+recordtoupsert);
     system.debug('objectApiName==>'+objectApiName);
        try{
            if(objectApiName == 'Opportunity')
            {
                list<OpportunityLineItem> oli = (list<OpportunityLineItem>)JSON.deserialize(recordtoupsert,list<OpportunityLineItem>.class);
               
                upsert oli;
            }
            else if(objectApiName == 'Order')
            {
                list<OrderItem> oi = (list<OrderItem>)JSON.deserialize(recordtoupsert,list<OrderItem>.class);
                upsert oi;
            }
          else  if(objectApiName == 'Quote')
            {
                list<QuoteLineItem> qli = (list<QuoteLineItem>)JSON.deserialize(recordtoupsert,list<QuoteLineItem>.class);
                upsert qli;
            }
        }
        catch(exception  ee )
        {
             throw new AurahandledException(ee.getmessage());
        }
    }
    @Auraenabled(cacheable = true)
    public static list<account> returnaccount()
    {
        return [select Id,Name,Industry,Phone from account order by createddate desc limit 10];
    }
    @Auraenabled
    public static list<sobject> returnproduct(string searchkey, string pricebookId)
    { string ss = '%'+searchkey +'%';
        try{
            return [select Id,Name,Pricebook2Id,Product2Id,Product2.Name,Product2.ProductCode,Product2.Family,Product2.Description,Product2.IsActive,UnitPrice from PricebookEntry where isActive = true AND Pricebook2Id =: pricebookId AND  (Product2.Name like : ss or Product2.ProductCode like : ss )  limit 100];
        }
        catch(exception ee)
        {
            throw new AurahandledException(ee.getmessage());
        }
    }
    
}