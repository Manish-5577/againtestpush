@restresource(urlmapping = '/caseupdate/')
global  class restapiscenario {

    @httppost
    global static void updatecasedata()
    {
        
        restrequest rq = restcontext.request;
        restresponse rr = restcontext.response;
        try{
        map<string, string> casenoeng = new map<string,string>();
        list<wrappercase> ww = (list<wrappercase>)JSON.deserialize((rq.requestBody.tostring()),list<wrappercase>.class);
        for(wrappercase wq : ww)
        {
            system.debug('wq====>'+wq.caseno);
            casenoeng.put(wq.caseno,wq.engno);
        }
        list<case> cc = [select id,CaseNumber,EngineeringReqNumber__c from case where CaseNumber in : casenoeng.keyset()];
        for(case ff : cc)
        {
            ff.EngineeringReqNumber__c = casenoeng.get(ff.CaseNumber);
        }
        if(cc.size()>0)
        {
            list<Database.SaveResult> ss = database.update(cc,false);
            for(Database.SaveResult dd : ss)
            {
                 if(dd.isSuccess())
                 {
                     restcontext.response.addHeader('Content-Type','text/Plain');
                     restcontext.response.responsebody= Blob.valueof('sucessfully updateed!!!!!!!!!!');
                 }else{
                     for(Database.error err : dd.getErrors())
                     {
                         restcontext.response.addheader('content-Type','text/plain');
                     restcontext.response.responsebody = Blob.valueof('reason for error '+err.getMessage());
                     }
                     
                 }
            }
            
        }else{
            
        }}
        catch(exception ee)
        {
             restcontext.response.addheader('content-Type','text/plain');
                     restcontext.response.responsebody = Blob.valueof('reason for error '+ee.getMessage());
        }
        
    }
    
    
    
    public class wrappercase
    {
        public  string caseno;
        public string  engno;
    }
    
}