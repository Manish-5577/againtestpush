public class weatherapipract {

    @auraenabled public  location locations{get;set;}
    @auraenabled public  current currents{get;set;}
  //  @auraenabled public static condition conditions{get;set;}
 //   @auraenabled public static condition conditions{get;set;}    
 
      public class location{
          @Auraenabled public string name {get;set;}
    @Auraenabled public string  region {get;set;}
    @Auraenabled public string country {get;set;}
     @Auraenabled public double lat {get;set;}
       @Auraenabled public double lon {get;set;}
    @Auraenabled public string tz_id {get;set;}
         @Auraenabled public double  localtime_epoch {get;set;}
           @Auraenabled public string localtime {get;set;}
         public location(JSONParser parser){
             while(parser.nextToken() != NULL){
                 if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
                     string text = parser.getText();
                     if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                     if(text == 'name'){
                         name = parser.getText();
                     }
                     else if(text == 'region'){
                         region = parser.getText();
                     }
                      else if(text == 'country'){
                         country = parser.getText();
                     }
                      else if(text == 'lat'){
                         lat = parser.getDoubleValue();
                     }
                      else if(text == 'lon'){
                         lon = parser.getDoubleValue();
                     }
                      else if(text == 'tz_id'){
                         tz_id = parser.getText();
                     }
                      else if(text == 'localtime_epoch'){
                         localtime_epoch = parser.getDoubleValue();
                     }
                      else if(text == 'localtime'){
                         localtime = parser.getText();
                     }
                 }
                 }
             }
         }
     }
    
    
    ///***************************************///
    
    public class current{
        
       
          @Auraenabled public double wind_mph {get;set;}
    @Auraenabled public double  wind_kph {get;set;}
    @Auraenabled public double wind_degree {get;set;}
     @Auraenabled public double wind_dir {get;set;}
       @Auraenabled public double pressure_mb {get;set;}
    @Auraenabled public double pressure_in {get;set;}
         @Auraenabled public double  precip_mm {get;set;}
           @Auraenabled public double precip_in {get;set;}
         public current(JSONParser parser){
             while(parser.nextToken() != NULL){
                 if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
                     string text = parser.getText();
                     if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                     if(text == 'wind_mph'){
                         wind_mph = parser.getDoubleValue();
                     }
                     else if(text == 'wind_kph'){
                         wind_kph = parser.getDoubleValue();
                     }
                      else if(text == 'wind_degree'){
                         wind_degree = parser.getDoubleValue();
                     }
                      else if(text == 'wind_dir'){
                         wind_dir = parser.getDoubleValue();
                     }
                      else if(text == 'pressure_mb'){
                         pressure_mb = parser.getDoubleValue();
                     }
                      else if(text == 'pressure_in'){
                         pressure_in =parser.getDoubleValue();
                     }
                      else if(text == 'precip_mm'){
                         precip_mm = parser.getDoubleValue();
                     }
                      else if(text == 'precip_in'){
                         precip_in = parser.getDoubleValue();
                     }
                 }
                 }
             }
         }
     } 
    
    public  weatherapipract(JSONParser parser){
                          while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    
					if (text == 'location') {
                        
				locations =  new location(parser);
                        system.debug('locations '+locations);
                  break;
                      
					}else if (text == 'current') {
						currents = new current(parser);
                         system.debug('currents '+currents);
                       
                        
					}
				}
			}
                          }
        
    }
    public static weatherapipract getweatherdetails(string locationss){
        
string keys =  'df4769cf2ae046b497d53256232110&q=';
          string endPoint='http://api.weatherapi.com/v1/current.json?key=';
        endpoint = endpoint + keys +  locationss;
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
	System.JSONParser parser = System.JSON.createParser(hresp1.getbody());
		return new weatherapipract(parser);

    }
    
    

  
	
}