trigger emailletter on Lead (before update) {

    
    for(lead ll : trigger.new)
    {
        system.debug('before update email');
        system.debug(ll.email);
    }
}