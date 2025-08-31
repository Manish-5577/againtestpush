public class testingscenarioo {

  @future(callout = true)
  public  static void testt()
    {  System.debug('testing');
       /* contact ff = [select id,lastname from contact limit 1];
   ff.lastname = 'http callout';
     update ff;*/
        string pincode = '400097';
          string endPoint='https://api.postalpincode.in/pincode/';
        
       endPoint = endPoint + pincode;
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
         hresp1=h1.send(req1);
system.debug(hresp1.getbody());
     system.debug('status code '+hresp1.getStatusCode());
  updatecont();
       
    }
    public static void updatecont()
    {
         contact ff = [select id,lastname from contact limit 1];
   ff.lastname = 'http callout';
     update ff;
    }

    
}