trigger accountopportunity on Account (after delete) {

    
    list<opportunity> opp = [select id from opportunity where accountid in : trigger.oldmap.keyset()];
    system.debug('oppp sizeeee' + opp.size());
    
    
}