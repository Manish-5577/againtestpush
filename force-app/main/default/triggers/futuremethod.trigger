trigger futuremethod on Account (before insert,before update,after update) {
   /* if(trigger.isafter && trigger.isupdate){
     string ids  ;  
          System.debug('---- Trigger run ---->'+Trigger.New.size() );
         for(account ss :trigger.new)
         {
            ids = ss.Id;  
         }
    if(!future22.ff) {
        future22.ff = true;
       futuremethodacc.updateacc(ids);  
    }
    }*/
  

     
    
    if(trigger.isbefore && trigger.isupdate){
for(account acc : trigger.new)
        { 
         //  acc.adderror('beforetriggete enteerd ');
            Approval.ProcessSubmitRequest req1 = 
            new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for a@@@@@@@@@@@@@#');
        req1.setObjectId(acc.id);
        
        // Submit on behalf of a specific submitter
        req1.setSubmitterId('0055j000007eNLfAAM'); 
          
              Approval.ProcessResult result = Approval.process(req1);
                          
           // acc.rating = 'cold';
        }  
         
    
        } 
    
}