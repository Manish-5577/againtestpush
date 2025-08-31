public class sepakerinfofromeventpage {

    @auraenabled
    public static List<EventSpeakers__c> getspeaker(string eventid){
        
        List<EventSpeakers__c> es = [select id,Speaker__r.Email__c,Speaker__r.Name,Speaker__r.Phone__c,Speaker__r.Company__c,Name,Event__c,Speaker__r.About_Me__c,Speaker__r.Picture__c from EventSpeakers__c where event__c =: eventid];
        return es;
    }
    @auraenabled
    public static List<Event__c> getlocations(string eventid){
        
List<event__c> evloc = [select id,location__c,location__r.street__c,location__r.city__c,location__r.state__c,location__r.Postal_Code__c from event__c where id =:eventid];
        return evloc;
    }
    @auraenabled
    public static List<Event_Attendee__c> getaattendee(string eventid){
        
List<Event_Attendee__c> evattende = [select id,Attendee__c,Attendee__r.Company_Name__c,Attendee__r.Email__c,Attendee__r.Name,Attendee__r.Phone__c	 from Event_Attendee__c where 	Event__c =:eventid];
        return evattende;
    }
    @auraenabled
    public static List<event__c> getupcomingevent(){
        return [select id,name,Name__c,Event_Detail__c,Location__c,Location__r.name,Event_Organizer__c,Event_Organizer__r.name,Start_DateTime__c from event__c where 	Start_DateTime__c >= today and  Live__c = true];
    }
    @auraenabled 
    public static list<Event_Attendee__c> getattendeeinfo(string id ){
        return [ select id,Name,event__c,event__r.Start_DateTime__c,event__r.Name__c,event__r.Event_Organizer__r.Name,event__r.Location__c,event__r.Location__r.Name,Attendee__r.Name from Event_Attendee__c  where Attendee__c=:id and  event__r.Start_DateTime__c >= today and event__r.live__c =true];
    }
     @auraenabled 
    public static list<Event_Attendee__c> getattendeepastevent(string id ){
        return [ select id,Name,event__c,event__r.Start_DateTime__c,event__r.Name__c,event__r.Event_Organizer__r.Name,event__r.Location__c,event__r.Location__r.Name,Attendee__r.Name from Event_Attendee__c  where Attendee__c=:id and  event__r.Start_DateTime__c < today];
    }
}