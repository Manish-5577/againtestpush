@istest
public class testclass3 {

    @testsetup
    public static void preparedrecord()
    {list<case> cc1 = new list<case>();
        
        for(integer i =0;i<88;i++)
        {
            case cc = new case();
            cc.status = 'new';
            cc.origin = 'phone';
            cc1.add(cc);
            
        }
     insert  cc1;
    }
    
      @istest()
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
         for(case acc : [select id from case  limit 50])
         {
              system.debug(acc);
             acc.status = 'rating';
             update acc;
         }
    }
}