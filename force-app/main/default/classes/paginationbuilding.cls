public class paginationbuilding {
    
    
    @auraenabled(cacheable = true)
    public static list<account> getaccount()
    {
        return [select id,name,rating from account ];
    }
      @AuraEnabled
    public static void updateAccount( String strRecordId ) {
     
        update new Account(
            Id = strRecordId,
            Description = String.valueOf(
                System.now()
            )
        );
         
    }
    @auraenabled
    public static list<account> paginateapproach(integer limits, integer offsett)
    {  system.debug(limits + 'nnnn' + offsett);
        return [select id,name,rating from account limit :limits  offset :offsett];
    }
    public static void abc()
    {
        
    }
     public static void abc(integer nn)
    {
        
    }
    public static void abc(integer nn,string hh)
    {
        
    }

}