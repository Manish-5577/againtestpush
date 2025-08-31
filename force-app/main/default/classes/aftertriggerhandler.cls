global class aftertriggerhandler {
   public static void afterinsertneo(list<account> acc)
   {
      List<account> aff = [select id,(select id from contacts) from account];
        List<account> aff1 = [select id,(select id from contacts)  from account];
        List<account> aff2 = [select id,(select id from contacts)  from account];
       system.debug('remaining queries'+ Limits.getQueries());
       system.debug('getLimitQueries()==>'+limits.getLimitQueries());
        system.debug('getQueryLocatorRows()==>'+limits.getQueryLocatorRows());
        system.debug('getLimitQueryLocatorRows()==>'+limits.getLimitQueryLocatorRows());
        system.debug('getQueryRows()==>'+limits.getQueryRows());
        system.debug('getLimitQueryRows()==>'+limits.getLimitQueryRows());
        system.debug('Limits.getLimitAggregateQueries==>'+Limits.getLimitAggregateQueries());
   }
    public static void deletecheck(list<account> deleteacc)
    {
        for(account acc : deleteacc)
        {
            acc.rating = 'hot';
        }
    }
    
    public static void afterinsertoldreadOnlyTest(list<account> oldaccount)
    {
        for(account acc :oldaccount )
        {
            acc.rating = 'hot';
        }
    }
    public static void beforeupdateoldtrigger(list<account>oldacc){
        for(account acc : oldacc)
        {
            acc.rating = 'hot';
        }
    }
    public static void afterinsert(List<account> acc){
          set<id> ss = new set<id>();
   List<contact> cc = new list<contact>();
        map<id,contact> con = new map<id,contact>();
          for(account jj : acc){
        ss.add(jj.id);
         contact nn = new contact(lastname=jj.name);
      cc.add(nn);
        con.put(jj.id,nn);
    }
        
          if(cc.size()>0){
insert cc;
        }
    list<account> accc = new List<account> ();
       List<account> acc1 = [select id,name,contact__c from account where id in:ss];
    for(account kk : acc1){
        contact cc1 = con.get(kk.id);
        account newacc = new account();
        newacc.id = kk.id;
        newacc.Contact__c = cc1.id;
accc.add(newacc);
    }
        update accc;
        
    }
    
    
    public static void beforeinsert(List<account> acc){
        list<account> acc2 = new list<account>();
        for(account acc1 :acc){
         acc2.add(acc1) ;
        }
        update acc2;
    }
    public static void beforeupdate(list<account> acc , list<account> oldacc){
        
          list<account> acc2 = new list<account>();
      
        for(account acc1 : acc){
       acc1.rating = 'warm';
            delete acc1;
            //acc2.add(acc1);
        }
     //   update acc2;
        
   /*        list<account> acc2 = new list<account>();
        list<id> ss = new list<id>();
        for(account acc1 : acc){
         ss.add(acc1.id);
        }
      list<account> accneo = [select id,rating from account where id in : ss];
        for(account sd : accneo)
        {
            sd.rating = 'warm';
           
        }
        update acc2;*/
    }
       public static void afterupdate(list<account> acc ){
       list<account> acc2 = new list<account>();
        for(account acc1 : acc){
               // acc1.industry = 'Agriculture';
               account mm = new account ();
            mm.Rating = 'hot';
            mm.id = acc1.id;
            acc2.add(acc1);
        }
           if(acc2.size()>0)
           {
               delete acc2;
           }          
   /*       list<account> acc2 = new list<account>();
           list<id> ll = new list<id>();
        for(account acc1 : acc){
             ll.add(acc1.id);
        }
          List<account> accneo = [select  id,rating from account where id in : ll];
           for(account acc1 : accneo)
           {
               acc1.rating = 'warm';
           }
           if(accneo.size()>0)
           {
               callinginherited.stopp =false;//Note if u will not use this then recursion issue will occur.
               update accneo;
           }
           
       */
    }
    public static void duplicatecon (list<contact> cc){
          recursionavoid.recursive = true;
        contact cc1 =  cc[0].clone(TRUE, false, false, false);
        insert cc1;
    }
    public static void afterupdateoncontact(list<contact> cc){
      
        set<id> accid = new set<id>();
        for(contact kk : cc){
            accid.add(kk.AccountId);
        }
     List<aggregateresult> agg = [ select accountid,sum(amount)sums from opportunity where accountid in : accid group by accountid ];
        Map<id,double> storesum = new map<id,double>();
        if(agg.size()>0){
        for(aggregateresult result : agg ){
            storesum.put((id)result.get('accountid'),(double)result.get('sums'));
        }
        }
        List<account> accupd = new list<account> ();
        for(account acc1 : [select id,name,sumofopp__c  from account where id in : accid]){
            if(storesum.containsKey(acc1.id)){
                account m1 = new account();
                m1.id = acc1.id;
                m1.sumofopp__c = storesum.get(acc1.id);
                accupd.add(m1);
            }
        }
        
        if(accupd.size()>0){
            update accupd;
        }
    }
    
    
}