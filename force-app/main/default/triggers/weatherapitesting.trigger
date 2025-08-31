trigger weatherapitesting on Contact (before insert,after insert) {

    if(trigger.isafter && trigger.isinsert)
    {
        for(contact cc : trigger.new)
        {
            weatherapi.sentrequesttoweatherapi(cc.MailingCity,cc.Id);
        }
       
    }
    
    
    
}