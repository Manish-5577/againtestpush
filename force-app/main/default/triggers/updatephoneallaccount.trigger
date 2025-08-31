trigger updatephoneallaccount on Account (before insert,after update) {

    if(trigger.isafter &&  trigger.isupdate){
    for(account acc : trigger.new)
    {
         handleraccountupdate.updatephone(trigger.new,trigger.oldmap);
    }
    }
}