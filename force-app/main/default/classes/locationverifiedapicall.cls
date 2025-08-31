public class locationverifiedapicall {
@future(callout= true)
    public static void verfiyaddress(string recordid){
        
        location__c ll =[SELECT Id, Street__c, State__c, Postal_Code__c, Land_Mark__c, Country__c, City__c, Name FROM Location__c where id =:recordid];
        
        
    /*     string endPoint='https://us-street.api.smarty.com/street-address?auth-id=62da50fc-4b5b-96cf-368b-b028465772a4&auth-token=11FIhy1imfOCg1jwPaDI&candidates=10&';
     endpoint = endpoint + 'street='+ll.street__c+'&city='+ll.city__c+'&state='+ll.State__c+'&zipcode='+ll.Postal_Code__c+'&match=enhanced';
   Note ****************  if u use above url then u will get below error 
       Your browser sent an invalid request.
             |<html><body><h1>400 Bad request</h1>
       
       Reason ====> is in api document of smarty.com it was clearly mention they want url in encode form hence we need to encode data
    */
        string endPoint = 'https://us-street.api.smarty.com/street-address?auth-id=62da50fc-4b5b-96cf-368b-b028465772a4&auth-token=11FIhy1imfOCg1jwPaDI&candidates=10&';
        endpoint += 'street='+encodingutil.urlencode(ll.street__c,'UTF-8')+'&city='+encodingutil.urlencode(ll.city__c,'UTF-8')+'&state='+encodingutil.urlencode(ll.State__c,'UTF-8')+'&zipcode='+encodingutil.urlencode(ll.Postal_Code__c,'UTF-8')+'&match=enhanced';
      //  endPoint = endPoint + pincode;
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
         req1.setTimeout(120000);
        
        try{
        hresp1=h1.send(req1);
      system.debug(hresp1.getbody());
            if(hresp1.getStatusCode() == 200 && hresp1.getStatus() =='ok'){
                string responsebody = hresp1.getBody();
                //note if street city state all are empty then in response we are getting blank array '[]' i.e response length is 2 hence if address is not valid then we got response length ==2
                //hence for valid address always length is > 2 
                if(!string.isblank(responsebody) && responsebody.length()>2){
                    ll.Verified__c =true;
                }
                else{
                    ll.Verified__c = false;
                }
                update ll;
            }else{
                
                exceptionhandling.handlestringmssgexcp( hresp1.getBody(),'locationverifiedapicall');
            }
        }
        catch (exception ex){
           // exceptionhandling.handlestringmssgexcp 
    exceptionhandling.handle(ex, 'locationverifiedapicall');
        }



    }
}