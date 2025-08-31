public class currencyconverter {

public string success;
   
  public string   timestamp;
  public string   base ;
   public date  dates;
    
   
 //   public class JSON2Apex {

	public static void currencyy(){
	list<wrapppercurrency>  ll = new list<wrapppercurrency>();
        string endPoint='http://api.exchangeratesapi.io/v1/latest?access_key=';
string accesskey='fab7fe934513dd1aecf9f17a9faf5c50';

    endpoint= endpoint +accesskey;
      //  endPoint = endPoint + pincode;
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
        
    /*
     * if you want to store any specific va;ue of any key  of resposne like success : true ,date:23/10/23,base:encode
     *   here in below code imm storing suucess ki value only similary u store any key or all key based on your requirement 
     *     Jsonparser parser = json.createparser(hresp1.getbody());
        parser.nextToken();
      
        while(parser.nextToken() != Null){
            if(parser.getcurrentToken() == jsontoken.FIELD_NAME){
                string text = parser.getText();
                if(text == 'success'){
                    if(parser.nextToken() != jsontoken.VALUE_NULL){
                        string suu = parser.getText();
                        system.debug('suu'+suu);
                        breAK;
                    }
                }
            }
        }   
        */
        
      /* 
       * 
       * 
this code will create object with label as currency name and value as current rate 
eg      {'INR': 87.332,
           'AOA':62.11,
           'AML':92.223
             }

       *  JSONParser parser = JSON.createParser(hresp1.getBody());
               parser.nextToken();
        while (parser.nextToken() != Null) {
			if (parser.getCurrentToken() == System.JSONToken.START_OBJECT) {
                system.debug('test startobject');
                 wrapppercurrency postall = (wrapppercurrency)parser.readValueAs(wrapppercurrency.class);
                                 
                                 ll.add(postall);
                system.debug('posta;lll'+postall);
                               
				
                }
                                        }*/
     
        
            }
      
        
        
      
        
        
         /*         
          * 
here this block will give u exact currency based on user input see below code where requiredcurrency variable is an input variable of user 
for eg if variable = inr 
then it will compare inr  with resposne ans matching currency rate u will get and stored in mm variable
          *            if(hresp1.getStatusCode() ==200){
           JSONParser parser = JSON.createParser(hresp1.getBody());
               parser.nextToken();
               while (parser.nextToken() != null ) {
                   system.debug('testtttt'+parser.getText());
                  
                   if(requiredcurrency ==parser.getText()){
                     parser.nextToken();
                       string mm = parser.getText();
                       system.debug('mm====>'+mm);
                   }*/
                   
                    // wrapppercurrency postall = (wrapppercurrency)parser.readValueAs(wrapppercurrency.class);
               
                             
        public class wrapppercurrency{
	
	public string INR;
            	public string AED;
            	public string ALL;
            	public string AMD;
          //  public string AOA;
        }
    public class wrapper2{
        
    }
}
	/*public JSON2Apex(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'success') {
						success = parser.getBooleanValue();
					} else if (text == 'timestamp') {
						timestamp = parser.getIntegerValue();
					} else if (text == 'base') {
						base = parser.getText();
					} else if (text == 'date') {
						date_Z = parser.getText();
					} else if (text == 'rates') {
						rates = new Rates(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	*/
	
/*	public static JSON2Apex parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new JSON2Apex(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
*/	






//}