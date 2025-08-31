trigger accounttriggertransactiontest on Account (before insert) {

    system.debug('accountcountin single transaction'+trigger.size);
}