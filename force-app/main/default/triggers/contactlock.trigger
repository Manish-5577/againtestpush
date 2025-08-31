trigger contactlock on Contact (after insert) {

    
    list<id> ss = new list<id>();
    for(contact gg : trigger.new)
    {
        ss.add(gg.id);
    }
    Approval.LockResult[] lrList = Approval.lock(ss, false);
    for(Approval.LockResult lr : lrList) {
    if (lr.isSuccess()) {
        // Operation was successful, so get the ID of the record that was processed
        System.debug('Successfully locked account with ID: ' + lr.getId());
    }
    else {
        
        // Operation failed, so get all errors                
        for(Database.Error err : lr.getErrors()) {
            System.debug('The following error has occurred.');                    
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
    }
}