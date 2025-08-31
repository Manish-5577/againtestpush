public class indianpostalcodeintegration {
    
    
  //  Overload of AuraEnabled method: getdataUsingPincodecode overload is not permitted
    
        @invocablemethod(label= 'invoacbletest') 
    public static list<string> getdataUsingPincodecode(list<string>  pincode)
    {
        List<postalcodewrapper> postalcodedata = new   List<postalcodewrapper>();
        
    //   withsharinginnerclAss.accountss();
        
   HTTPResponse  response1  =  indianpostalcodeintegration.fetchdata(string.valueof(pincode[0]));
   system.debug(response1.getbody());
            if(response1.getStatusCode() ==200){
           JSONParser parser = JSON.createParser(response1.getBody());
               parser.nextToken();
                while(parser.nextToken()!=NULL){
                   
                     if(parser.getcurrentToken() == jsontoken.START_ARRAY){
                         while(parser.nextToken()!=NULL){
                             if(parser.getcurrentToken() ==  jsontoken.START_OBJECT){
                    postalcodewrapper postall = (postalcodewrapper)parser.readValueAs(postalcodewrapper.class);
                                  postall.Pincode = string.valueof(pincode[0]);
                                 postalcodedata.add(postall);
                                   system.debug('covid19===>'+postall);
                             }
                         }
                     }
                     
                     
                     
                 }
               
            }      
        return new list<string>{'abc'};
        
    }
    
    
    
    
    
        @AuraEnabled
    public static list<postalcodewrapper> getdataUsingPincodecode(string pincode)
    {
      //  futurecallinginrestapi.testttt();
        List<postalcodewrapper> postalcodedata = new   List<postalcodewrapper>();
        
    //   withsharinginnerclAss.accountss();
        
   HTTPResponse  response1  =  indianpostalcodeintegration.fetchdata(pincode);
   system.debug(response1.getbody());
            if(response1.getStatusCode() ==200){
           JSONParser parser = JSON.createParser(response1.getBody());
               parser.nextToken();
                while(parser.nextToken()!=NULL){
                   
                     if(parser.getcurrentToken() == jsontoken.START_ARRAY){
                         while(parser.nextToken()!=NULL){
                             if(parser.getcurrentToken() ==  jsontoken.START_OBJECT){
                    postalcodewrapper postall = (postalcodewrapper)parser.readValueAs(postalcodewrapper.class);
                                  postall.Pincode = pincode;
                                 postalcodedata.add(postall);
                                   system.debug('covid19===>'+postall);
                             }
                         }
                     }
                     
                     
                     
                 }
               
            }      
        return postalcodedata;
        
    }
  
    Public static httpresponse fetchdata(string pincode){
      //  futurecallinginrestapi.testttt();
        string endPoint='https://api.postalpincode.in/pincode/';
        
       endPoint = endPoint + pincode;
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
      //  tettt();
       
       return hresp1;
    }
    
      @AuraEnabled
    public static list<postalcodewrapper> getdataUsingbranchname(string branchname)
    {
        List<postalcodewrapper> postalcodedata = new   List<postalcodewrapper>();
        
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
                     if(parser.getcurrentToken() == jsontoken.START_object){
                         while(parser.nextToken()!=NULL){ 
                              system.debug('5555555'+parser.getCurrentName());
                             if(parser.getcurrentToken() ==  jsontoken.START_OBJECT){
                    postalcodewrapper postall = (postalcodewrapper)parser.readValueAs(postalcodewrapper.class);
                                 postalcodedata.add(postall);
                                
                             /*    if(parser.getCurre1ntName() == 'Pincode'){
                                     mm =mm+1 ;
                                     system.debug('getText'+parser.getText()+ '@@@@@@');
                                 }*/
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
   // @future //  @AuraEnabled
    public static void tettt()
    {
          account acc = [select id from account limit 1];
        acc.rating = 'HOT';
        update acc; 
    }
    
    public class postalcodewrapper{
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