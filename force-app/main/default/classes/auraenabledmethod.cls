public class auraenabledmethod {

    
    
    @auraenabled
    public static list<account> lazyloading(integer limitsss, integer offsett)
    {
        return [select id,name from account  limit :limitsss offset :offsett];
    }
    
    
    
    
    
  @auraenabled(cacheable = false)
    public static list<wrappaccconopp>  wrapperdata()
    {
          lisT<wrappaccconopp> wopp = new list<wrappaccconopp>();
        for(account acc : [select id,name,(select id,name from contacts),(select id,name from opportunities) from account order by lastmodifieddate desc  limit 10])
        {
            wrappaccconopp wcc = new wrappaccconopp(acc.name, acc.id, acc.contacts, acc.opportunities);
            wopp.add(wcc);
        }
        return wopp;
    }
    public class wrappaccconopp
    {
      @auraenabled  public string accountname;
       @auraenabled  public string id;
      @auraenabled   public list<contact> cc;
       @auraenabled  public list<opportunity> opp;
        public wrappaccconopp(string name, string id, list<contact> con, list<opportunity> opp)
        {
            this.accountname  = name;
            this.id = id;
            this.cc = con;
            this.opp = opp;
        }
    }
    
}