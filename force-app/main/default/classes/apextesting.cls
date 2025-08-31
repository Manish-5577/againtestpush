public class apextesting {
    
    public static void ss()
    {
        list<wrapper> ww = new list<wrapper>();
        for(contact cc : [select id,name from contact order by createddate desc limit 10])
        {
            wrapper  wp = new wrapper(cc.id,cc.name);
            ww.add(wp);
        }
        string ccc = json.serialize(ww);
        system.debug(ccc);
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        req.setMethod('GET');
        Http https = new Http();
        HTTPResponse res = https.send(req);
        list<contact> cc1 = new list<contact>();
        
        //  System.debug(res.getBody());
        integer  i =0;
        JSONParser parser = JSON.createParser(res.getBody());
        parser.nextToken();
        while(parser.nextToken()!=NULL){
            system.debug('hureee');
            if(parser.getcurrentToken() == jsontoken.START_object){ 
                wrapper2 postall = (wrapper2)parser.readValueAs(wrapper2.class);
                if(i<10){
                contact cc2 = new contact();
                cc2.id = ww[i].id;
                cc2.lastname = postall.id;
                cc1.add(cc2);
                system.debug('postall==>'+postall);i++;
                }
            }
        }
        update cc1;
    }
    
    public class wrapper
    {
        string id;
        string name;
        
        public wrapper(string ids, string namee)
        {
            this.id = ids;
            this.name = namee;
        }
    }
    
    public class wrapper2
    {
        @auraenabled public string userid;
        @auraenabled  public string id;
        @auraenabled public string title;
        @auraenabled  public string body;
        
        /*  public wrapper2(string userid, string id,string title,string body)
{
this.userid = userid;
this.id = id;
this.title = title;
this.body = body;
}*/
    }
   
}