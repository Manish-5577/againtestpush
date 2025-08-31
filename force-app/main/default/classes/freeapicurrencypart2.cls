public class freeapicurrencypart2 {
  Public static string responses;
    @auraenabled(cacheable=true)
    public static  void  getcurrency()
    {
         date dd = system.today()-1;
         Http h = new HTTP();
  HttpRequest req = new HttpRequest();
   req.setMethod('GET');
      //  https://api.freecurrencyapi.com/v1/historical
        string endpoint = 'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_uM52MMGGkQ1o1UCWR3LNKqe3bG26hyLEc4ukovF1';
    // endpoint = endpoint + '&date='+'2023-11-07';
  req.setEndpoint(endpoint);
   req.setHeader('Accept','application/json');
    req.setHeader('Content-Type', 'application/json');
        HttpResponse res = h.send(req);
        system.debug('response is'+res.getBody());
    Map<String, Object> mm = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        system.debug('keys are'+mm.keyset());
        system.debug('values are '+mm.values());
      
       // List<object> bb= (object)JSON.deserializeUntyped(mm.values());
        
// List<Object> a = (List<Object>)mm.get('data');
   /*     List<Map<String, Object>> data = new List<Map<String, Object>>();
        for (Object instance : (List<Object>)mm.get('data')){
    data.add((Map<String, Object>)instance);   
        }*/
       // system.debug('666666'+data[0]);
        //system.debug('testtttting'+wrapperclassapicurrencypart2.parse(res.getBody()));
//List<string> ss = wrapperclassapicurrencypart2.parse(res.getBody()).getkeys();
    }
}