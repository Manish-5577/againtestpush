trigger restrictsubmittertoapprove on Case (before update,after  update) {

 set<id> ss = new set<id>();
  if(restrictsubmitterhandler.futureMethodRunOnce &&  trigger.isafter && trigger.isUpdate)
  {
    for(case cc : trigger.new)
    {
        restrictsubmitterhandler.callingfuture(trigger.new);
        
      /* 
        if( cc.approval_status__c == 'waiting' )
        
        {
           
          ProcessInstance pp = [select TargetObjectId, LastActorId,LastModifiedById,SubmittedById,status,ElapsedTimeInDays from ProcessInstance where TargetObjectId =: cc.id order by createddate desc limit 1 ];
                     if(pp != null  && pp.Status == 'pending' )
                     {system.debug('checkkk');
                      cc.current_approver__c = String.valueOf(pp.ElapsedTimeInDays);
                             if(pp.SubmittedById == UserInfo.getUserId())
                             {
                                 cc.adderror('you are  not allowed to appprove the request');
                             }
                     }
        
        }
        
     */   
        /*   if(pp != null){
     List<processInstancestep> pp1 = [select id,ProcessInstanceId,ActorId,CreatedById from processInstancestep where ProcessInstanceId =: pp.id order by createddate desc   ];
            if(pp1 != null  && pp1.size()>0){
                system.debug('size of pp1 is &&&&===>'+pp1.size());
               // system.debug('pp1.id ====>'+pp1[pp1.size()-1].id);
          for(processInstancestep hh : pp1)
           {
               system.debug('id of step is '+hh.id);
            }
                if(pp1[0].ActorId   == pp.SubmittedById)
                {
         // cc.adderror('you are not allowed');
                }
            }*/
    
      }
  }
    
   /*   if(trigger.isbefore && trigger.isUpdate  &&  restrictsubmitterhandler.futuretwice)  
      {
          for(case cc : trigger.new)
          {  system.debug('cc currentapprover is '+cc.current_approver__c);
           if(cc.approval_status__c == 'waiting'){
                     ProcessInstance pp = [select TargetObjectId, LastActorId,LastModifiedById,SubmittedById,status,ElapsedTimeInDays from ProcessInstance where TargetObjectId =:cc.id   order by createddate desc limit 1 ];
                  
           if(pp != Null)
           {system.debug('cc.current_approver__c'+cc.current_approver__c);
           if(cc.current_approver__c == string.valueof(pp.SubmittedById))
           {
              cc.adderror('you are not allowed');
           }
          }
           }
          }
      }
        
    */
}