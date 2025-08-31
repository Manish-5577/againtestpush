trigger checklabelandapiname on Account (before insert) {

   for(account mm : trigger.new)
   {
       mm.testt__c =   'test23';
   }
}