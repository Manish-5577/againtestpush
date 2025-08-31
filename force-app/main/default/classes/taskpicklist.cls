Global with sharing class taskpicklist {
   
   
    @auraenabled(cacheable=true)
    global static list<task>  fetchalltask(){
        
        return [select id,	Description,ActivityDate,Priority,Status,Subject from task where ownerid =: userinfo.getuserId() and ActivityDate <> null];
    }
    
    
@auraenabled 
    global static void createtaskrecord(string taskdata){
        Task taskrecord = (Task)JSON.deserializeStrict(taskdata, Task.class);
        upsert taskrecord;
    }
    
    
@auraenabled 
    global static void createrecord(string data){
       Account record = (Account)JSON.deserializeStrict(data, Account.class);
//      insert record;

     //insert as user record;
    // database.insert(record, false);
   List<account> acclol = new List<account>();
        acclol.add(record);
   SObjectAccessDecision securityDecision =  Security.stripInaccessible(AccessType.CREATABLE, acclol);
        insert securityDecision.getRecords()[0];
      //  database.insert(record,false);
    }
    
       @auraenabled(cacheable=true)
    global static  Map<string,string> fetchpicklist2(string objectcApiName,string fieldName){
        
       Map<string,string> picklistt = new Map<string,string>();
        Schema.SObjectType s = Schema.getGlobalDescribe().get(objectcApiName) ;
        Schema.DescribeSObjectResult r = s.getDescribe();
        Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
        Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
       
        for(Schema.PicklistEntry  ss : ple){
            picklistt.put(ss.getlabel(),ss.getvalue());
        }
        return picklistt;
        
    }
    @auraenabled(cacheable=true)
    global static list<account> stripaccessbilityUseCase()
    {
    
    SObjectAccessDecision securityDecision = 
         Security.stripInaccessible(AccessType.READABLE,
                 [SELECT Name, securitycheck__c, stage__c FROM account order by createddate desc limit 1]);
        System.debug('what is security decision'+securityDecision.getRemovedFields());
  return securityDecision.getRecords();
    // Construct the output table
 /*   if (securityDecision.getRemovedFields().get('Campaign').contains('ActualCost')) {
        for (Campaign c : securityDecision.getRecords()) {
        //System.debug Output: Name, BudgetedCost
        }
    } else {
        for (Campaign c : securityDecision.getRecords()) {
        //System.debug Output: Name, BudgetedCost, ActualCost
        }*/
}
    

    
    
    @auraenabled(cacheable=true)
    public static list<taskpicklist.picklist> fetchpicklist(string objectcApiName,string fieldName){
        List<taskpicklist.picklist> picklistvalue = new  List<taskpicklist.picklist>();
        Schema.SObjectType s = Schema.getGlobalDescribe().get(objectcApiName) ;
        Schema.DescribeSObjectResult r = s.getDescribe();
        Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
        Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            taskpicklist.picklist pick  = new taskpicklist.picklist(pickListVal.getlabel(),pickListVal.getvalue());
            
            picklistvalue.add(pick);
        }   
        system.debug('picklistvalue===>'+picklistvalue);
        return picklistvalue;
        
    }
    public class picklist
    {
        @auraenabled
        public string label;
        @auraenabled 
        public string value;
        
        public picklist(string label, string value){
            this.label = label;
            this.value = value;
        }
    }
}