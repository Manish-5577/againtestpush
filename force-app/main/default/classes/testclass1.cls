@istest(isparallel =true)
public class testclass1 {

     @testsetup
    public static void preparedrecord()
    {list<account> cc1 = new list<account>();
        
        for(integer i =0;i<500;i++)
        {
            account aacc =  new account();
            aacc.name = 'battt'+i;
            aacc.rating = 'cold';
            cc1.add(aacc);
        }
     insert  cc1;
    }
    @istest(seealldata=false)
    public static void tt()
    {
         for(case acc : [select id from case limit 50])
         {
             system.debug(acc);
             acc.status = 'rating';
             update acc;
         }
    }
    @istest(seealldata =false)
      public static void tt1()
    {
         for(case acc : [select id from case limit 50])
         {
               system.debug(acc);
             acc.status = 'rating';
             update acc;
         }
    }
    
}