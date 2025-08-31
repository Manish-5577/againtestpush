trigger transactiontestcontact on Contact (before insert,after insert) {

   map<id,account> mm = new map<id,account>();integer i =0;
    if(trigger.isafter && trigger.isinsert)
    {
    for(contact cc : trigger.new)
    {
        if(math.mod(i,2) == 0)
        {
            account acc1 = new account();
        acc1.name = 'cont' + cc.id;
        acc1.rating = 'hot';
        mm.put(cc.id,acc1);
        }
        else 
        {
            account acc1 = new account();
        acc1.name = 'cont' + cc.id;
        acc1.rating = 'cold';
        mm.put(cc.id,acc1); 
        }
        i++;
        
    }
     database.insert(mm.values(),false);
    list<contact> toupd = new list<contact>();
    for(contact cc : [select id,accountid from contact where id in : mm.keyset()   ])
    {
        
        if(mm.get(cc.id).id != null)
        {
            cc.AccountId = mm.get(cc.id).id;
            toupd.add(cc);
        }
    }
        if(toupd.size() > 0)
        {
            update toupd;
        }
        
    }
    
    

//    integer i =0;list<account> acclist = new list<account>();
   /* if(trigger.isafter && trigger.isinsert)
    {
        for(contact  cc : trigger.new) 
        {  
              if(string.isblank(cc.firstname) )
              {  system.debug('hurrreeu'+i);
                 cc.adderror('cc first name empty');
               if(i >= 1){
                   system.debug('lllnlnln  ncold');
              account acc = new account();
               acc.name = cc.id + 'todduy';
               acc.rating = 'cold';
               acclist.add(acc);
               }
               if(i<1)
               {system.debug('llll hot day');
                     account acc = new account();
               //acc.name = cc.id + 'todduy';
               acc.rating = 'hot';
               acclist.add(acc);
               }
              }
            i++;
        }
    }
    if(acclist.size()>0)
    {
        database.insert(acclist,true);
    }
*/   
}