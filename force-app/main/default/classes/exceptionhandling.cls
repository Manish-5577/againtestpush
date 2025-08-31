public class exceptionhandling {

    public static void handle(system.Exception ex, string processname){
      
        error_log__c nn = new error_log__c();
        nn.Log_Details__c = ex.getCause() + ' <br/> <strong> message is </strong>  message is ' + ex.getMessage() + '<br/>   cause ' + ex.getCause() + ' </br> '+ ex.getTypeName()+' <br/> line number is '+ex.getLineNumber();
        nn.Lod_DateTime__c = system.now();
        nn.Process_Name__c = processname;
        insert nn;
    }
 
        public static void handlestringmssgexcp(string  error, string processname){
      
        error_log__c nn = new error_log__c();
        nn.Log_Details__c = error;
        nn.Lod_DateTime__c = system.now();
        nn.Process_Name__c = processname;
        insert nn;
    }
}