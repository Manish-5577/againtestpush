public class readonly {

    
    public static integer i = 0;
    public integer yy = 0;
    
    
   @auraenabled
    public static list<account> getAccounts(integer limitsize , integer offsets)
    {   
        contact cc = [select id,lastname from contact limit 1];
        cc.lastname = 'updated test1';
        update cc;
        list<account> acc = [select Id,Name,Industry,Type  from Account  limit : limitsize offset : offsets];
        return acc;
    }
    @auraenabled
    public static list<account> getdatabyIdapproach(string lastname, string lastid)
    {
         contact cc = [select id,lastname from contact limit 1];
        cc.lastname = 'updated test1';
        update cc;
        return [select id,name from account where (name >: lastname) or (name = :lastname  and id >: lastId ) ];
        
    }
    @auraenabled(cacheable = true)
    public static list<account> initialoaddata()
    {
         contact cc = [select id,lastname from contact limit 1];
        cc.lastname = 'updated test1';
      // update cc;
        return [select id,name from account order by Name,Id limit 500];
    }
      @auraenabled
    public static list<account> initialoaddata333()
    {
         contact cc = [select id,lastname from contact limit 1];
        cc.lastname = 'updated test1';
        update cc;
        return [select id,name from account order by Name,Id limit 500];
    }
          @auraenabled(cacheable = true)
    public static list<account> initialoaddata33344()
    {
         contact cc = [select id,lastname from contact limit 1];
        cc.lastname = 'updated test1';
       // update cc;
        return [select id,name from account order by Name,Id limit 500];
    }
    
}