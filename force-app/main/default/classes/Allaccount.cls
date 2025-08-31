public class Allaccount {

    @AuraEnabled(cacheable =true)
    public static List<account> getallaccount(string mm){
        
        List<account> acc = [select id,Name,Phone from account limit 10];
        for(account accw : acc)
        {
            accw.name = 'u[ated via cacheable true';
        }
       // update acc;
        return acc;
    }  @AuraEnabled(cacheable =true)
    public static List<account> getallaccount23(){
        
        List<account> acc = [select id,Name,Phone from account limit 10];
       
        return acc;
    }
    @auraenabled(cacheable=true)
    public static wrappo2 imperativetest()
    {   wrappo2 ww = new wrappo2();
        try{
        for(integer i =0;i<100;i++)
        {
            list<account> acc = [select id from account limit 10];
        }
          ww.datat = 'lallalalala';
            return ww;
    }
        catch(exception ee)
        {
             ww.error = ee.getmessage();
            return ww;
        }
     
       
    }
        
        
      public class wrappo2
      {
         @auraenabled public  string datat;
        @auraenabled  public string error;
         
      }
        
        
        
        
}