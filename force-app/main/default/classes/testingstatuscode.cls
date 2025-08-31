public class testingstatuscode {

  @AuraEnabled(Cacheable = true)
  public static List<Opportunity> getOpportunity(){
    return [SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunity LIMIT 10];
  }

   @auraenabled
    public static list<account> getaccount()
    {
        try{
            return [select id,Name,Createddate,(select id,name from contacts),(select id,name,stagename from opportunities) from account order by lastmodifieddate desc nulls last limit 20];
        }
        catch(exception ee)
        {
            throw new  aurahandledexception('lallalalala error');
        }
    }
}