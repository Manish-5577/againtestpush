trigger triggerpract on Account (before insert,after insert,before update,after update ) {
    
    
    if(trigger.isafter && trigger.isInsert)
    {
      aftertriggerhandler.afterinsertneo(trigger.new);
    }
    
    if(trigger.isafter && trigger.isinsert){
        
      //  aftertriggerhandler.afterinsert(trigger.new);
    //   aftertriggerhandler.afterinsertoldreadOnlyTest(trigger.old);
    }
    if(trigger.isbefore && trigger.isinsert){

     //  aftertriggerhandler.beforeinsert(trigger.new);
    }
     if(trigger.isbefore && trigger.isupdate){

   //    aftertriggerhandler.beforeupdate(trigger.new,trigger.oldMap);beforeupdateoldtrigger
    }
     if(trigger.isafter && trigger.isupdate){

 //    aftertriggerhandler.beforeupdateoldtrigger(trigger.old);
    }
     if(trigger.isafter && trigger.isupdate){

    //   aftertriggerhandler.afterupdate(trigger.new);
    }
    
    
    
/*set<id> ss = new set<id>();
   List<contact> cc = new list<contact>();
  map<id,contact> con = new map<id,contact>();
    if(trigger.isafter && trigger.isinsert){
    for(account jj : trigger.new){
        ss.add(jj.id); 
         contact nn = new contact(lastname=jj.name);
      cc.add(nn);
        con.put(jj.id,nn);
    }*/
        
   /*     for(contact hh : con.values()){
            cc.add(hh);
        }*/
     /*   if(cc.size()>0){
insert cc;
        }
    }list<account> accc = new List<account> ();
       List<account> acc = [select id,name,contact__c from account where id in:ss];
    for(account kk : acc){
        contact cc = con.get(kk.id);
        account newacc = new account();
        newacc.id = kk.id;
        newacc.Contact__c = cc.id;
accc.add(newacc);
    }
        update accc;
        
    */    
    
    
}