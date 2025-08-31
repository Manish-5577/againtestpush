trigger attendeeemail on Event_Attendee__c (after  insert) {
    
    if(trigger.isafter && trigger.isinsert)
    {
attendeeemailhandler.sendemailtoattendee(trigger.new);
    }
}