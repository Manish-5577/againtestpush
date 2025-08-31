trigger account on AccountChangeEvent (after insert) {

    for(AccountChangeEvent ace : trigger.new)
    {
        system.debug('llalalal'+ace);
        contact cc = new contact();
        cc.lastname = 'testingg33';
        cc.firstname = 'klmlkdq22';
        cc.email = 'mkkuyyni@kd.com';
        insert cc;
    }
}