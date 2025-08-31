public class practindianpostal {

    
       @AuraEnabled
     public static list<postalcodewrapper2> getdataUsingbranchname2(string branchname)
    {
        List<postalcodewrapper2> postalcodedata = new   List<postalcodewrapper2>();
        
         string endPoint='https://api.postalpincode.in/postoffice/';
        endPoint = endPoint + branchname;
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
          integer mm= 0;
    hresp1=h1.send(req1);
system.debug(hresp1.getbody());
            if(hresp1.getStatusCode() ==200){
           JSONParser parser = JSON.createParser(hresp1.getBody());
               parser.nextToken();
                while(parser.nextToken()!=NULL){
                //ses    system.debug('parser necttoken '+parser.nextToken()+'token value'+parser.getcurrentToken()+parser.getCurrentName());
                             
                     if(parser.getcurrentToken() == jsontoken.START_ARRAY){
                         while(parser.nextToken()!=NULL){ 
                             if(parser.getcurrentToken() ==  jsontoken.START_OBJECT){
                                //s system.debug('5555555'+parser.getCurrentName());
                  postalcodewrapper2 postall = (postalcodewrapper2)parser.readValueAs(postalcodewrapper2.class);
                  
                                 system.debug('postall'+postall);
                                 postalcodedata.add(postall);
                                
                                if(parser.getCurrentName() == 'Pincode'){
                                     mm =mm+1 ;
                                     system.debug('getText'+parser.getText()+ '@@@@@@');
                                 }
                                   system.debug('covid19===>'+postall); 
                             }
                         }
                     }
                     
                     
                     
                 }
                system.debug('mm==>>>>>'+mm);
            }      
        system.debug('size is '+postalcodedata.size());
        return postalcodedata;
        
    }
    
    public class postalcodewrapper2{
        @auraenabled
      public string  Name;
        @auraenabled  
        public string  Description;
      @auraenabled 
        public string  BranchType;
    @auraenabled  
        public string  DeliveryStatus;
  @auraenabled      
        public string  Circle;
       @auraenabled
        public string  District;
     @auraenabled
        public string  Division;
    @auraenabled   
        public string  Region;
     
      @auraenabled  
        public string  State;
      @auraenabled
        public string  Country;
       @auraenabled 
        public string  Pincode;
        
       
        
        
    }
}