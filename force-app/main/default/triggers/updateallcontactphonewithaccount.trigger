trigger updateallcontactphonewithaccount on Account (after update) {
map<id,string> acc = new map<id,string>();
    for(account ac  :trigger.new){
        
        acc.put(ac.id,ac.Phone);
    }
   List<contact> cc = [ select id,name,phone,accountid from contact where accountid in : acc.keySet()];
    List<contact> cc1 = new List<contact>();
    if(cc.size()>0){
    for(contact  con : cc){
        if(acc.containsKey(con.accountid)){
            contact cc =  new contact();
            cc.id = con.id;
            cc.phone= acc.get(con.accountid);
            cc.AccountId = con.AccountId;
            cc1.add(cc);
        }
    }
        if(cc1.size()>0){
            update cc1;
        }
    
        }
}