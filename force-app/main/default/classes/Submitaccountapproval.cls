public class Submitaccountapproval {

 //notes test class of this class is "testbitlypart2"
    public static void submitForApproval(List<account> acc)

    {
        // Create an approval request for the Opportunity
        for(account acc1 :acc){
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval automatically using Trigger');
        req1.setObjectId(acc1.id);
        Approval.ProcessResult result = Approval.process(req1);
        }

    }
    @auraenabled
    public static void submititforaprovall(string id){
        
        account acc = [select id,name,rating,industry from account where id =: id];
         Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval automatically using Trigger');
        req1.setObjectId(acc.id);
        Approval.ProcessResult result = Approval.process(req1);
    }
    @auraenabled
    public static void submititforaprovall2(string approverid,string recordid){
        
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();

        req1.setComments('Submitting request for approval automatically using Trigger');
        req1.setObjectId(recordid);
        req1.setNextApproverIds(new Id[] {approverid});
        Approval.ProcessResult result = Approval.process(req1);
    }
    
    

}