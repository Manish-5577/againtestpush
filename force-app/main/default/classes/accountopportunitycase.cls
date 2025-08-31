public abstract class accountopportunitycase  {
    
    
    @auraenabled
    public static list<account> fetchaccountdetails()
    {
        return [select id,name from account limit 50];
    }
    
    @auraenabled
    public  static list<wrappercaseopp> fetchaccrelatedrecord(list<id> acctid)
    { 
        list<wrappercaseopp> ww = new list<wrappercaseopp>();
        for(account acc : [select id,(select id,casenumber from cases), (select id,name from opportunities) from account where id in : acctid])
        {
             wrappercaseopp  wcop = new wrappercaseopp(acc.opportunities, acc.cases);
                ww.add(wcop);
        }
     return ww;
    }
    
    @future
    private static void lalalal()
    {
        
    }
    
   
    public class wrappercaseopp
    {
     @auraenabled   public list<case> cc;
      @auraenabled  public list<opportunity> opp;
        
  public wrappercaseopp(list<opportunity> oo , list<case> cc)
        {
            this.cc = cc;
            this.opp = oo;
        }
    }

}