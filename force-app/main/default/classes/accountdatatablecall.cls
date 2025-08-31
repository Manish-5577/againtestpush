public class accountdatatablecall {
    
    @auraenabled(cacheable=true)
    public static list<account> fetchaccount()
    {
        return [select id,Name,rating,phone,type from account  limit 10];
    }

}