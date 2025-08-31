public class practweatherapi {

/*	public class Condition {
	@auraenabled	public String text;
	@auraenabled	public String icon;
	@auraenabled	public Integer code;
	}*/

@auraenabled	public Location location;
//@auraenabled	public Current current;

/*	public class Current {

	@auraenabled	public Double pressure_in;
@auraenabled		public Double precip_mm;
	@auraenabled	public Double precip_in;
	@auraenabled	public Integer humidity;
	@auraenabled	public Integer cloud;
	@auraenabled	public Double feelslike_c;
	@auraenabled	public Double feelslike_f;
	@auraenabled	public Double vis_km;
	@auraenabled	public Double vis_miles;
	@auraenabled	public Double uv;
	@auraenabled	public Double gust_mph;
	@auraenabled	public Double gust_kph;
        @auraenabled	public condition condition;
	}*/

	public class Location {
	@auraenabled	public String name;
	@auraenabled	public String region;
	@auraenabled	public String country;
	@auraenabled	public Double lat;
	@auraenabled	public Double lon;
	@auraenabled	public String tz_id;
	@auraenabled	public Integer localtime_epoch;
	@auraenabled	public String localtime;
	}

	@auraenabled
	public static practweatherapi parse(string loc) {
        string keys =  'df4769cf2ae046b497d53256232110&q=';
       
          string endPoint='http://api.weatherapi.com/v1/current.json?key=';
        endpoint = endpoint + keys +  loc;
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
          practweatherapi pp ;
        JSONParser parser = JSON.createParser(hresp1.getBody());
               parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if(text == 'location'){
                    pp = (practweatherapi)System.JSON.deserialize(hresp1.getbody(), practweatherapi.class);
                        }
                    }
                }
        }
        return pp;
	//return (practweatherapi) System.JSON.deserialize(hresp1.getbody(), practweatherapi.class);
	}
   
}