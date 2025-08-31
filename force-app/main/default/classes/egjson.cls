public class egjson {
	public Integer userId;
	public Integer id;
	public String title;
	public String body;
public static string jsonstring;
 /*   public static string testt(){
          string endPoint='https://jsonplaceholder.typicode.com/posts';
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
    hresp1=h1.send(req1);
        jsonstring = hresp1.getBody();
        
        return jsonstring;
    }
   */
    
   
	
	public static List<egjson> parse() {
        
             string endPoint='https://jsonplaceholder.typicode.com/posts';
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
    hresp1=h1.send(req1);
        jsonstring = hresp1.getBody();
        
        
		return (List<egjson>) System.JSON.deserialize(jsonstring, List<egjson>.class);
	}
}