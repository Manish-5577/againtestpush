trigger accoutaddressupdate on Account (before insert,before update,after update) {

 /*   map<id,account> mm = new map<id,account>();
    for(account kk : trigger.new){
        if(kk.BillingCity != trigger.oldmap.get(kk.id).BillingCity){
                          mm.put(kk.id,kk);
        }
    }
    
    List<contact> cc = [select id,name,MailingCity,accountid  from contact where accountid in : mm.keySet()];
    List<contact> upcc = new list<contact>();
    if(cc.size()>0){
        
        for(contact c1 : cc){
            if(mm.containsKey(c1.accountid)){
              
            c1.MailingCity = mm.get(c1.AccountId).billingCity;
                upcc.add(c1);
            }
        }
    }
    if(upcc.size()>0){
        update upcc;
    }*/
    
    
  //  above trigger we can write  in different way 
    if(trigger.isafter && trigger.isupdate){
    set<id> accid = new set<id>();
    for(account ff : trigger.new){
        if(ff.billingcity != trigger.oldmap.get(ff.id).billingcity){
                accid.add(ff.id);
        }
    }
    List<contact> cc = new List<contact>();
    List<account> acc = [select id,name,billingcity,(select id from Contacts) from account where id in:accid ];
    for(account ac1 : acc){
        if(ac1.contacts != null){
            for(contact kk : ac1.contacts){
                kk.MailingCity = ac1.BillingCity;
                cc.add(kk);
            }
        }
    }
    
    if(cc.size()>0){
        update cc;
    }
    }
    
//    Note if above trigger work in before update then contact mailing city ill old value of account bcoz before update indicate your value is not saved into database 
      //  hence we have written query parentchild query it gives old value of biling city not the new one new one not yet saved 
    
    
    
    
    
    
    
    
}