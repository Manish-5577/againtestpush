public class wrapperclasseg {

    public static void testfuture()
    {
        
    }
       
    @auraenabled(cacheable = true)
    public static list<wrapperconopp> fetchcontactopportunity()
    {
        list<wrapperconopp> www = new list<wrapperconopp>();
        list<account> acc = [ select id,(select id from Contacts),(select id from Opportunities)  from account];
        for(account aa : acc)
        {
            wrapperconopp ww = new wrapperconopp(aa, aa.contacts, aa.Opportunities,aa.contacts.size(), aa.Opportunities.size());
            www.add(ww);
        }
        return www;
        
    }
    
    public class wrapperconopp{
        @auraenabled
        public account accname;
        @auraenabled
        public list<contact> cc;
        @auraenabled
        public list<opportunity> opp;
        @auraenabled
        public integer contsizecont;
        @auraenabled
        public integer oppsizecont;
        
        public wrapperconopp(account acc, list<contact> acccon, list<opportunity> ops, integer consz, integer oppsize)
        {
            this.accname =acc;
            this.cc = acccon;
            this.opp = ops;
            this.contsizecont = consz;
            this.oppsizecont = oppsize;
        }
        
        
           
    }
    
    @future
    public static void abcc()
    {
         queualble2 qq2 = new queualble2();
        system.enqueuejob(qq2);
 queualble2 qq23 = new queualble2();
        system.enqueuejob(qq23);
    }
}