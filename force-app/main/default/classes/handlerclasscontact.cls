public class handlerclasscontact {

 @auraenabled
    public static string opportunityamt(list<opportunity> opp,list<opportunity> oldd)
    { /*set<id> acctid = new set<id>();
        if(opp != null && oldopp == null)
        {
            for(opportunity aoo : opp)
            {
                acctid.add(aoo.accountid);
            }
        }
     else if(oldopp != null && opp != null)
     {
         for(opportunity jj : opp)
         {
             if(jj.amount != oldopp.get(jj.id).amount)
             {
                 acctid.add(jj.accountid);
             }
         }
     }
     else if(oldopp != null) {
         for(opportunity oo : oldopp.values())
         {
             acctid.add(oo.accountid);
         }
     }
     list<account> acc1 = new list<account>();
     system.debug('accout id ==>'+ acctid);
     for(aggregateresult ag : [select sum(amount) sums,accountid accid from opportunity where accountid in :acctid  group by accountid ])
     {
         system.debug(' string.valueof'+ string.valueof(ag.get('sums')));
         account acc = new account();
         acc.id = (id)ag.get('accid');
         acc.Description = string.valueof(ag.get('sums'));
         acc1.add(acc);
     }
     if(acc1.size() > 0)
     {
         update acc1;
     }*/
     return 'abc';
    }
    
    @future
    public static void abc(string mm ,string nn, integer mn , list<integer> inu)
    {
                        
    }
    
    
    
    
   @AuraEnabled
    public static String serverEcho() {
        return ('Hello from the server');
    }
    public static void duplicatecheck(list<contact> cc)
    {  
    }
    
    public static void nn(list<contact> cc , map<id,contact>  oldcon)
    {
        set<id> ss = new set<id>();
     if(oldcon == null && cc != null)
     {
         //insert undelete
        for(contact gg : cc)
        {
            ss.add(gg.ownerid);
        }
         
     }
     else if(cc == null && oldcon != null)
     {// delete
         
         for(contact dd : oldcon.values())
         {
             ss.add(dd.ownerid);
         }
     }
        else {
             // update
             for(contact hh : cc)
             {
                 if(hh.ownerid != oldcon.get(hh.id).ownerid)
                 {
                     ss.add(hh.ownerid);
                     ss.add(oldcon.get(hh.id).ownerid);
                 }
             }
        }
        map<string,integer> useridconcount = new map<string,integer>();
        list<user> usertoupd = new list<user>();
        for(aggregateresult ag : [select count(id) abc,ownerid from contact where OwnerId in : ss group by OwnerId ])
        {
          //  useridconcount.put(string.valueof(ag.get('OwnerId')),integer.valueof(ag.get('abc')));
            user uu = new user();
            uu.id = (string)(ag.get('ownerid'));
            uu.countcontact__c = (double)ag.get('abc');
            system.debug('is it coming'+(string)(ag.get('ownerid')) + 'ineteger==>'+(double)ag.get('abc') );
            usertoupd.add(uu);           
        }
        if(usertoupd.size()>0)
        {
            update usertoupd;
        }
      /*  list<user> uutoupd = new list<user>();
        for(user uu : [select id,countcontact__c from user where id in : ss])
        {
            uu.countcontact__c = useridconcount.get(uu.id);
            uutoupd.add(uu);
        }
       update  uutoupd;*/
        
        
        
        
        
        
        
        
        
        
    }
}