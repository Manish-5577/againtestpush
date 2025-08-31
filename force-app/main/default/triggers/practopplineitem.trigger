trigger practopplineitem on OpportunityLineItem (before insert) {

    
set<id> oppid = new set<id>();
    for(OpportunityLineItem opp :trigger.new){
        oppid.add(opp.OpportunityId);
    }
    integer count = 0;integer increment ;string finalcountt = '';integer count2 =0;
    List<OpportunityLineItem> opli = [select id,OpportunityId,prodcount__c from OpportunityLineItem where OpportunityId in:oppid];
    List<OpportunityLineItem> newoli = new  list<OpportunityLineItem>();
    //   1
    if(opli.size()>0){
        for(OpportunityLineItem ool :opli){
           
            if(ool.prodcount__c != null){
            string  counttemp = ool.prodcount__c;
            system.debug('count is ==>'+counttemp);
            integer storedcount = integer.valueOf(counttemp.right(1));
            integer increment = storedcount+1;
            system.debug('increment ==>'+increment);
            OpportunityLineItem oo  =  new OpportunityLineItem();
            oo.id= ool.id;
            oo.prodcount__c = counttemp+ ','+string.valueOf(increment);
                finalcountt = counttemp+ ','+string.valueOf(increment);
            newoli.add(oo);
            }else {
                system.debug('opli.sizeis ==>'+opli.size());
                if(count2 == 0){
                for(integer i =1;i<=(opli.size()+1);i++){
                    
                   
                    if(i == opli.size()+1){
                          finalcountt = finalcountt +string.valueof(i);
                    }else{
                         finalcountt = finalcountt +string.valueof(i)+ ',';
                    }
                    count2 = 1;
                }
                }
                      OpportunityLineItem oo12  =  new OpportunityLineItem();
            oo12.id= ool.id;
                    oo12.prodcount__c = finalcountt;
                     newoli.add(oo12);
               
            }
        }
        for(OpportunityLineItem lol :trigger.new){
            lol.prodcount__c = finalcountt;
        }
        
        update  newoli;
    }

    else{
        for(OpportunityLineItem kk :trigger.new){
            kk.prodcount__c = '1';
        }
    }
    
    
    
    
   
    
}