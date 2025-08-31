trigger transactiontestcount on Account (before insert) {

    
    system.debug('triger record size !!!!!!'+trigger.size);
}