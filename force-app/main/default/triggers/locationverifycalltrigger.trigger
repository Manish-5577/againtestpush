trigger locationverifycalltrigger on Location__c (after insert) {
    for(Location__c ll : trigger.new){
    locationverifiedapicall.verfiyaddress(ll.id);
        }
}