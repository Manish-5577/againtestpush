public class Linkedinintegration {
  /*  public static string  authCodeFromURL ;
    public static boolean isCode =true;
    public static  String consumerKey = '77umq0ymd0kua5'; // Your Client Id here
    public static String consumerSecret ='LyNhOKCnMbgSMcYY'; // Your Client Secret here
    public Final String redirect_URI = 'https://tccss-dev-ed.develop.lightning.force.com/lightning/n/LinkedIn_Integration'; // VF page preview URL
    public String linkedln_Scope = 'r_fullprofile%20r_emailaddress';//pass as it is fixed valuebut refer doc in linked in
    public static String linkedln_AuthUrl = ' https://www.linkedin.com/oauth/v2/authorization?';//url mention in doc for getting code note '?' is required at the end 
    public Final String accessToken_Endpoint = 'https://www.linkedin.com/oauth/v2/accessToken';
    
    //note  redirect_URL is an non static varibale hence to access that variable  u need   to need to create instance of class first 
    //later on u can access see below eg  mm.redirect_URI  
    
   */ 
 /* public Linkedinintegration(){
        authCodeFromURL = ApexPages.currentPage().getParameters().get('code');
        if(authCodeFromURL == null || authCodeFromURL == '')
            isCode = true;
        else
            isCode = false;
       }*/
    
  
    
    
 /*  @Auraenabled
    public static string  getauthorizationcode(){
        Linkedinintegration  mm = new Linkedinintegration();
       
        String requestoAuthURL = linkedln_AuthUrl + 'response_type=code&client_id='+consumerKey+'&redirect_uri='+mm.redirect_URI+
            
            '&state=foobar&scope=r_liteprofile%20r_emailaddress%20w_member_social';
        
        PageReference pageRef = new PageReference(requestoAuthURL);
     
      system.debug('pagrefernce is===>'+pageRef);
        return requestoAuthURL;
        
    }
   @AuraEnabled 
    public static void getaccesstoken(){
        
        Linkedinintegration nn = new Linkedinintegration();
        Http http = new Http();
          HttpRequest httpReq = new HttpRequest();  
        HttpResponse httpRes = new HttpResponse();
            String requestTokenBody = 'code='+authCodeFromURL+'&grant_type=authorization_code'+
             '&client_id='+consumerKey+'&client_secret='+consumerSecret+
            '&redirect_uri='+nn.redirect_URI;
         String errorMessage = '';
         System.debug('#### authCodeFromURL '+authCodeFromURL);
        System.debug('#### requestTokenBody '+requestTokenBody);
          httpReq.setMethod('POST');
         httpReq.setEndpoint(nn.accessToken_Endpoint);
        httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
         httpReq.setBody(requestTokenBody);
        
  try{
             httpRes = http.send(httpReq);
            if(httpRes.getStatusCode() == 200){
                  Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,
                                          'Congrattzzzzz..... You have done successfull Integration with Linkedln'));
                 }else{
                  errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
             }
            
        }catch(System.Exception e){
            System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());
             if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage =  'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                                     +' Remote Site Setting and add '+' '+ nn.accessToken_Endpoint +' Endpoint';
                  ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
             }else{
                  errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
                     +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                 ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
                
            }
            
        }
        
        
        
    }*/
}