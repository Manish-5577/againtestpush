public class wrapperclassapicurrencypart2 {

@auraenabled public Data data {get;set;} 

	public wrapperclassapicurrencypart2(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'data') {
						data = new Data(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'wrapperclassapicurrencypart2 consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Data {
	@auraenabled	public Double AUD {get;set;} 
		@auraenabled	public Double BGN {get;set;} 
		@auraenabled	public Double BRL {get;set;} 
		@auraenabled	public Double CAD {get;set;} 
		@auraenabled	public Double CHF {get;set;} 
		@auraenabled	public Double CNY {get;set;} 
		@auraenabled	public Double CZK {get;set;} 
		@auraenabled	public Double DKK {get;set;} 
		@auraenabled	public Double EUR {get;set;} 
		@auraenabled	public Double GBP {get;set;} 
		@auraenabled	public Double HKD {get;set;} 
		@auraenabled	public Double HRK {get;set;} 
		@auraenabled	public Double HUF {get;set;} 
		@auraenabled	public Double IDR {get;set;} 
		@auraenabled	public Double ILS {get;set;} 
		@auraenabled	public Double INR {get;set;} 
		@auraenabled	public Double ISK {get;set;} 
		@auraenabled	public Double JPY {get;set;} 
		@auraenabled	public Double KRW {get;set;} 	
		@auraenabled	public Double MXN {get;set;} 
	@auraenabled		public Double MYR {get;set;} 
		@auraenabled	public Double NOK {get;set;} 
		@auraenabled	public Double NZD {get;set;} 
	@auraenabled		public Double PHP {get;set;} 
	@auraenabled		public Double PLN {get;set;} 
		@auraenabled	public Double RON {get;set;} 
		@auraenabled	public Double RUB {get;set;} 
		@auraenabled	public Double SEK {get;set;} 
		@auraenabled	public Double SGD {get;set;} 
		@auraenabled	public Double THB {get;set;} 
		@auraenabled	public Double TRY_Z {get;set;} // in json: TRY
		@auraenabled	public Integer USD {get;set;} 
		@auraenabled	public Double ZAR {get;set;} 

		public Data(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'AUD') {
							AUD = parser.getDoubleValue();
						} else if (text == 'BGN') {
							BGN = parser.getDoubleValue();
						} else if (text == 'BRL') {
							BRL = parser.getDoubleValue();
						} else if (text == 'CAD') {
							CAD = parser.getDoubleValue();
						} else if (text == 'CHF') {
							CHF = parser.getDoubleValue();
						} else if (text == 'CNY') {
							CNY = parser.getDoubleValue();
						} else if (text == 'CZK') {
							CZK = parser.getDoubleValue();
						} else if (text == 'DKK') {
							DKK = parser.getDoubleValue();
						} else if (text == 'EUR') {
							EUR = parser.getDoubleValue();
						} else if (text == 'GBP') {
							GBP = parser.getDoubleValue();
						} else if (text == 'HKD') {
							HKD = parser.getDoubleValue();
						} else if (text == 'HRK') {
							HRK = parser.getDoubleValue();
						} else if (text == 'HUF') {
							HUF = parser.getDoubleValue();
						} else if (text == 'IDR') {
							IDR = parser.getDoubleValue();
						} else if (text == 'ILS') {
							ILS = parser.getDoubleValue();
						} else if (text == 'INR') {
							INR = parser.getDoubleValue();
						} else if (text == 'ISK') {
							ISK = parser.getDoubleValue();
						} else if (text == 'JPY') {
							JPY = parser.getDoubleValue();
						} else if (text == 'KRW') {
							KRW = parser.getDoubleValue();
						} else if (text == 'MXN') {
							MXN = parser.getDoubleValue();
						} else if (text == 'MYR') {
							MYR = parser.getDoubleValue();
						} else if (text == 'NOK') {
							NOK = parser.getDoubleValue();
						} else if (text == 'NZD') {
							NZD = parser.getDoubleValue();
						} else if (text == 'PHP') {
							PHP = parser.getDoubleValue();
						} else if (text == 'PLN') {
							PLN = parser.getDoubleValue();
						} else if (text == 'RON') {
							RON = parser.getDoubleValue();
						} else if (text == 'RUB') {
							RUB = parser.getDoubleValue();
						} else if (text == 'SEK') {
							SEK = parser.getDoubleValue();
						} else if (text == 'SGD') {
							SGD = parser.getDoubleValue();
						} else if (text == 'THB') {
							THB = parser.getDoubleValue();
						} else if (text == 'TRY') {
							TRY_Z = parser.getDoubleValue();
						} else if (text == 'USD') {
							USD = parser.getIntegerValue();
						} else if (text == 'ZAR') {
							ZAR = parser.getDoubleValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static wrapperclassapicurrencypart2 parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new wrapperclassapicurrencypart2(parser);
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
	





    
}