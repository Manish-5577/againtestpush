trigger stagetimecalculation on Case (before update) {

    for( case cc : trigger.new)
    {
        if(cc.status !=  trigger.oldmap.get(cc.id).status){          
            datetime dd =  cc.statsufieldtracking__c;           
            if(dd == null)
            {
                cc.statsufieldtracking__c = cc.createddate;
            } 
           long timespent =  ((datetime.now().getTime() -  cc.statsufieldtracking__c.getTime())/(1000*60));
            system.debug('now min check '+ timespent);
            if(string.isblank(cc.statustiming__c ))
            {
                cc.statustiming__c =  string.valueof(timespent);
            }
            else
            {
                if(integer.valueof(timespent) >   integer.valueof(cc.statustiming__c) )
                {
                    cc.statustiming__c = string.valueof(timespent);
                }
            }
          //  list<string> ss = cc.statustiming__c.split(':');
//system.debug(ss[1]);
          // cc.statustiming__c = trigger.oldmap.get(cc.id).status + ':'  + string.valueof(timespent);
            cc.statsufieldtracking__c =  datetime.now();

        }
    }
    
}