public class restrictsubmitterhandler {

 public static Boolean futureOnce = true;
   public static Boolean futureMethodRunOnce = true;
    public static Boolean futuretwice = true;
     public static Boolean futuremethodtwice = true;
public static void callingfuture(list <case> cc)
{ restrictsubmitterhandler.futureMethodRunOnce = false;
  set<id> ss = new set<id>();
 for(case cc1 : cc )
 {
     ss.add(cc1.id);
 }
 if(restrictsubmitterhandler.futureOnce)
 {
    restrictsubmitterhandler.runinfuture(ss);
 }
}

    
    @future
    public static void runinfuture(set<id> casee)
    {              restrictsubmitterhandler.futureOnce = false;
      
     map<id,case> cass = new map<id,case>([select id,current_approver__c,submittedId__c from case where id = : casee]);
     list<case> jojo = new list<case>();
     
     List<ProcessInstance> pp = [select TargetObjectId, LastActorId,LastModifiedById,SubmittedById,status,ElapsedTimeInDays from ProcessInstance where TargetObjectId in : casee  and status = 'pending' order by createddate desc ];
               
       for( ProcessInstance jj : pp)
       {       system.debug('modified id is ====>'+jj.LastModifiedById);
           case cc = cass.get(jj.TargetObjectId);
           cc.current_approver__c = jj.LastModifiedById;
          cc.submittedId__c = jj.SubmittedById;
        
           jojo.add(cc);
       }
     if(jojo.size() > 0){
         
     update jojo;
          restrictsubmitterhandler.futuretwice = true;
     }
     
     
   /*    for(case lelo : lol)
        {
              ProcessInstance pp = [select TargetObjectId, LastActorId,LastModifiedById,SubmittedById,status,ElapsedTimeInDays from ProcessInstance where TargetObjectId =: lelo.id order by createddate desc limit 1 ];
                     if(pp != null  && pp.Status == 'pending' )
                     {
                         system.debug('checkkk lastmodified id -===>'+pp.LastModifiedById+'submittedbyId'+pp.SubmittedById);
                    //  lelo.current_approver__c = String.valueOf(pp.ElapsedTimeInDays);
                         
                             if(pp.SubmittedById == UserInfo.getUserId())
                             {
                                 lelo.current_approver__c =  String.valueOf(pp.ElapsedTimeInDays);
                                 //lelo.adderror('you are  not allowed to appprove the request');
                                 system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
                             }
                     }
          //  jojo.add(lelo);
        }
        update jojo;
*/        
    }
}