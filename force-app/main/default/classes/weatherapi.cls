public class weatherapi {

    //@future(callout = true)
  @future(callout = true) @auraenabled(cacheable=true)
    public static void sentrequesttoweatherapi(string cityname,id contactt)
    {
        
         Http h = new HTTP();
  HttpRequest req = new HttpRequest();
   req.setMethod('GET');
        string endpoint = 'https://open-weather13.p.rapidapi.com/city/' + cityname;
         req.setEndpoint(endpoint);
         req.setHeader('X-RapidAPI-Key','7c214b4c1amsh77f56afa68ad819p1bae24jsn6fecc1591b5a');
                 req.setHeader('X-RapidAPI-Host','open-weather13.p.rapidapi.com');
       // If(Test.isRunningTest()){
             HttpResponse res = h.send(req);
        system.debug('response is'+res.getBody());
        system.debug('response'+res);
        if(res.getStatusCode() == 200)
        {
         Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
Map<String, Object> sys = (Map<String, Object>)m.get('sys');
string countrycode = (String)sys.get('country');
system.debug('countrycode==>'+countrycode);
        updatecontactcountry(contactt,countrycode);
             contact cc = [select id,mailingcity,lastname from contact limit 1];
       cc.lastname = 'mdd';
     update cc;
        }
     //   }
     /*   else 
        {  
 // Note we are generating wrong response such that we can call our updatecontactcountry method this method required two paremetr i.e country name,
 // and contact and country name we will get from response only hence we used below code where we created fake http response 
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200); // Set your desired status code
            response.setBody('{"coord":{"lon":72.8479,"lat":19.0144},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":91.38,"feels_like":87.8,"temp_min":85.89,"temp_max":91.38,"pressure":1016,"humidity":21},"visibility":3000,"wind":{"speed":6.91,"deg":260},"clouds":{"all":77},"dt":1706424428,"sys":{"type":1,"id":9052,"country":"us","sunrise":1706406232,"sunset":1706446720},"timezone":19800,"id":1275339,"name":"Mumbai","cod":200}');
  Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
Map<String, Object> sys = (Map<String, Object>)m.get('sys');
string countrycode = (String)sys.get('country');
           updatecontactcountry(contactt,countrycode);
        }*/
      
    }
    public static void updatecontactcountry(id contactt,string country)
    {
       
        if(country != '' && country != null ){
        contact cc = [select id,MailingCity from contact where id =:contactt ];
        cc.MailingCountry = country;
        update cc;
          
        }
          
    }
    public static void testii()
    {   contact cc = [select id from contact limit 1];
        sentrequesttoweatherapi('mumbai',cc.id);
    }
    
}