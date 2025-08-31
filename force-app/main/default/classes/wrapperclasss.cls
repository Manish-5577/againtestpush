public class wrapperclasss {

    
    
    public  static List<wrapperclass> acccontactopport()
    { 
        List<wrapperclass>  cc = new List<wrapperclass>();
        for(account acc : [select id,name,(select id from contacts),(select id from Opportunities) from account limit 200 ])
        {
        /*    wrapperclass  ww = new wrapperclass(acc,acc.contacts,acc.opportunities);
            cc.add(ww);*/
            wrapperclass cc1 = new wrapperclass();
            
            cc1.cc= acc.contacts;
            cc1.opp = acc.opportunities;
            cc1.acc = acc;
            cc.add(cc1);
        }
        for(wrapperclass we : cc)
        {
            system.debug('wrappeerdemo contact'+we.cc);
            system.debug('wrapper oportunity '+we.opp);
        }
        system.debug('yyyyyyyyyyyyyy'+cc[30]);
        return cc;
    }
    public  class wrapperclass{
        public List<contact> cc;
        public list<opportunity> opp;
        public account acc ;
       /* public wrapperclass(account aa,list<contact>ccc, list<opportunity>oppp)
        {
            this.cc = ccc;
            this.opp = oppp;
            this.acc  =aa;
        }*/
        
    }
}