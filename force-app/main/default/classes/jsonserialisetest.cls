public class jsonserialisetest {

    public static void testt()
    {
       account acc = [select id,name,phone,industry from account limit 1];
        string jsonstringeg = JSON.serialize(acc);
        system.debug('@@@@@@@'+jsonstringeg);
          HttpRequest req = new HttpRequest();
   //  req.setEndpoint('https://dummyjson.com/post');
     req.setMethod('POST');
          req.setBody(jsonstringeg);
        req.setTimeout(120000);
        req.setHeader('Content-Type', 'text/json');
        req.setEndpoint('https://jsonplaceholder.typicode.com/posts'); 
     Http http = new Http();
     HTTPResponse res = http.send(req);
     System.debug('resposne'+res.getBody());
        
        //
    }
    
}