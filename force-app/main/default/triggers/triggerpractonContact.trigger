trigger triggerpractonContact on Contact (before insert,after insert,after update) {

    
    if(trigger.isafter && trigger.isinsert)
    {
        handlerclassonContact.updatenoofactivecontact(trigger.new);
    }
}