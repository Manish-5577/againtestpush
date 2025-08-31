public class attendeeemailhandler {

    public static void sendemailtoattendee(List<Event_Attendee__c> ee){
        set<id> eventt = new set<id>();
    set<id> attendee = new set<id>();
    set<id> eventattende = new set<id>();
    
    for(Event_Attendee__c ss : ee){
        eventt.add(ss.Event__c);
        attendee.add(ss.Attendee__c);
        eventattende.add(ss.id);
    }
    Map<id,event__c> eventmap = new map<id,event__c>([select id,name,Name__c,Start_DateTime__c,Location__c,Event_Organizer__c,Event_Organizer__r.Name,Location__r.street__c,Location__r.City__c,Location__r.State__c,Location__r.Country__c,Location__r.Postal_Code__c,Location__r.Name from  event__c where id in : eventt]);
        Map<id,Attendee__c> attendeemap = new map<id,Attendee__c>([select id,name,Location__c,Email__c from  Attendee__c where id in : attendee]);
List<messaging.SingleEmailMessage> emailist = new List<messaging.SingleEmailMessage>();
    List<Event_Attendee__c> ee1 = [ select id,Name,Attendee__c,event__c,Event__r.Name__c from Event_Attendee__c where id in :eventattende ];
    for(Event_Attendee__c ea : ee1){
        Attendee__c att = attendeemap.get(ea.Attendee__c);
        Event__c evt = eventmap.get(ea.event__c);
        messaging.SingleEmailMessage mail = new  messaging.SingleEmailMessage();
        mail.setSubject('Pass for the '+evt.Name__c);
        List<string> toadress = new List<string>();
        toadress.add(att.Email__c);
        mail.setSenderDisplayName(evt.Event_Organizer__r.Name);
        string location = 'https://www.google.com/maps/place'+evt.Location__r.street__c+' '+
            evt.Location__r.city__c+' '+evt.Location__r.state__c+' '+
            evt.Location__r.country__c +' '+evt.Location__r.postal_code__c;
        string hrefForLocation = '<a href = " '+location + '"'+'target="_blank">here</a>';
        string emailbody = 'Dear '+ att.Name+ ' ,'+
            'Thank You for registering for '+ evt.Name__c+ ' which will be organised on '+
            evt.Start_DateTime__c+ ' & will be held in  '+ evt.Location__r.name+
            '.we are excited to have you'+
            'Find the Google Map location for the event'+ hrefForLocation+ '.</br>'+
            'thanks,<br/>'+ evt.Event_Organizer__r.Name;
        mail.setHtmlBody(emailbody);
        
        emailist.add(mail);
        
        
    }
    try{
        List<messaging.SendEmailResult> results = messaging.sendEmail(emailist,false);
        for(Messaging.sendEmailResult email : results){
            if(!email.isSuccess()){
                List<Messaging.SendEmailError> errors = email.getErrors();
                 exceptionhandling.handlestringmssgexcp(Json.serialize(errors),'attendeeemail');
            }
        } 
    }
    catch(system.Exception ex){
        
    }
    }
}