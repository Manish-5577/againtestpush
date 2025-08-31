public class bitlytesting {

  
     @future(callout= true)
    public static void getshortlink(string  ids){
        system.debug('id=> '+ids);
        account acc = [select id,name,website,Description from account where id =: ids];
        string web = acc.Website;
     Http h = new HTTP();
  HttpRequest req = new HttpRequest();
   req.setMethod('POST');
     //named cred - callout:credname/url
     req.setEndpoint('callout:bitlyy/v4/shorten');
       
//req.setHeader('Authorization', 'Bearer {!$Credential.bitlyy.Password}');
//
/*Note to get how  many click  happen on any link u can use below endpoint
     req.setEndpoint('callout:bitlyy/v4/bitlinks/bit.ly/3RxqF8N/clicks/summary');*/
   req.setHeader('Accept','application/json');
    req.setHeader('Content-Type', 'application/json');
//system.debug('username'+{!$Credential.Username});
   req.setBody(JSON.serialize(new Map<string,Object>{
     'group_guid'=>'{!$Credential.Username}',
     'long_url'=> web,
    'domain'=>'bit.ly' 

        }));
system.debug(req.getheader('Authorization'));
system.debug(req.getBody());

        HttpResponse res = h.send(req);
system.debug('response is'+res.getBody());
        system.debug('response'+res);
        Map<string,Object> response = (Map<string,Object>)JSON.deserializeUntyped(res.getBody());

        string surl = (string ) response.get('link');
system.debug('surl is ==>'+surl);
       
      
        acc.Description = surl;
      
        update acc;
       // account an = [select id,name]
   //    update acc;
        system.debug('tetststs'+acc.id);
// return surl;
    }
       
   
    }