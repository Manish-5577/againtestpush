trigger accountupdate on Account (before insert,before update) {

    if(trigger.isbefore && trigger.isupdate){
        handleraccountupdate.updateaccount(trigger.new);
    }
    
}