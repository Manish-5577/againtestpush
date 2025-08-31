public class wrapperdataaccconopp {

    
    @auraenabled(cacheable=true)
    public static list<wrapperdata> wrapperacccon()
    {
        list<wrapperdata> www = new list<wrapperdata>();
        for(account acc : [select id,name,owner.name,(select id,name,email from contacts), (select id,name from opportunities) from account order by createddate desc limit 6])
        {
            wrapperdata ww = new wrapperdata(acc.opportunities,acc.contacts, acc);
            www.add(ww);
        }
        return www;
    }
    public class wrapperdata
    {
        @auraenabled public list<opportunity> opp;
        @auraenabled public list<contact> cc;
        @auraenabled public account  acc;
        public  wrapperdata(list<opportunity> opps ,list<contact> con, account acc )
        {
            this.opp = opps;
            this.cc = con;
            this.acc = acc;
        }
    }
}