public with sharing  class accountanditsrelatedconopp {

    @auraenabled(cacheable =true)
    public static list<wrapperconopp> accountanditsconoppp()   
    {
        list<account> acc = [select  id,name,(select id,name from contacts),(select id,name from opportunities ) from account order by createddate desc limit 10];
        list<wrapperconopp> WU = new list<wrapperconopp>();
        for( account  gg : acc)
        {
            wrapperconopp  ww = new wrapperconopp();
            ww.acc = gg;
            ww.cc = gg.contacts;
            ww.opp = gg.opportunities;
            wu.add(ww);
        }
        return wu;
    }
    
    
    public class wrapperconopp
    {
        
       @auraenabled public account acc;
       @auraenabled  public list<contact> cc;
      @auraenabled   public list<opportunity> opp;
    }
}