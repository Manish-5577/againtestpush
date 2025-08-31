trigger duplicatespeakerevebt on EventSpeakers__c (before insert,before update) {

 //   Map<Event__c,Speaker__c> mm  = new map<Event__c,Speaker__c>();integer
 integer count =0;
set<id> eventt = new set<id>();
    set<id> speaaker = new set<id>();

    for(EventSpeakers__c ee : trigger.new){
        eventt.add(ee.Event__c);
        speaaker.add(ee.Speaker__c);
       
    }
    event__c ee = [select id,Start_DateTime__c from event__c where id in :eventt ];
    datetime dd = ee.Start_DateTime__c;
    
    List<EventSpeakers__c> ll = [select id,Event__c,Speaker__c,event__r.Start_DateTime__c from EventSpeakers__c where Speaker__c in :speaaker];
    for(EventSpeakers__c hk : ll){
        if(hk.event__r.Start_DateTime__c == dd){
            count++;
        }
    }
    
    if(count >0){
        trigger.new[0].adderror('this speaker is already booked ');
    }
    
}