public class linkedinincla {

    
    
    public Boolean isCode { get; set; }

    public String authCodeFromURL { get; set; }

  //  public List<LinkedIn_Data__c> linkedlnInfoList { get; set; }

    public String BasicInfo { get; set; }

    public String urlToSharedPost { get; set; }

    public String sharedInformation { get; set; }

   

    public Final String consumerKey = '77umq0ymd0kua5'; // Your Client Id here

    public Final String consumerSecret ='LyNhOKCnMbgSMcYY'; // Your Client Secret here

    public Final String redirect_URI = 'https://tccss-dev-ed.develop.lightning.force.com/lightning/n/LinkedIn_Integration'; // VF page preview URL

    public String linkedln_Scope = 'r_fullprofile%20r_emailaddress';

    public Final String linkedln_AuthUrl = 'https://www.linkedin.com/oauth/v2/authorization?';

    public Final String accessToken_Endpoint = 'https://www.linkedin.com/oauth/v2/accessToken';

   

   

    public linkedinincla(){

        authCodeFromURL = ApexPages.currentPage().getParameters().get('code');

        if(authCodeFromURL == null || authCodeFromURL == '')

            isCode = true;

        else

            isCode = false;

           

   //     linkedlnInfoList = [Select Id, Name,Access_Token__c,Expires_In_Seconds__c From LinkedIn_Data__c Where Name='LinkedlnInfo'];

       

    }

   

    public PageReference doGetAuthorizationCode(){

        String requestoAuthURL = linkedln_AuthUrl + 'response_type=code&client_id='+consumerKey+'&redirect_uri='+redirect_URI+

                                     '&state=12345567dggd&scope=r_liteprofile%20r_emailaddress%20w_member_social%20w_member_social';

        PageReference pageRef = new PageReference(requestoAuthURL);

        return pageRef;

    }

   

/*    public void doGetAccessToken(){

       

        Http http = new Http();

        HttpRequest httpReq = new HttpRequest();

        HttpResponse httpRes = new HttpResponse();

       

        String requestTokenBody = 'code='+authCodeFromURL+'&grant_type=authorization_code'+

                                    '&client_id='+consumerKey+'&client_secret='+consumerSecret+

                                    '&redirect_uri='+redirect_URI;

        String errorMessage = '';

       

        System.debug('#### authCodeFromURL '+authCodeFromURL);

        System.debug('#### requestTokenBody '+requestTokenBody);

       

        httpReq.setMethod('POST');

        httpReq.setEndpoint(accessToken_Endpoint);

        httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');

        httpReq.setBody(requestTokenBody);

       

        try{

            httpRes = http.send(httpReq);

            if(httpRes.getStatusCode() == 200){

             

                Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());

               

         

               

             
               

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,

                                         'Congrattzzzzz..... You have done successfull Integration with Linkedln'));

          //      upsert linkedlnInfo;

               

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }catch(System.Exception e){

            System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());

            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){

                errorMessage =  'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'

                                    +' Remote Site Setting and add '+' '+ accessToken_Endpoint +' Endpoint';

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }

    }

   

    public void doFetchBasicInfo(){

   

        String errorMessage ='';

        Http http = new Http();

        HttpRequest httpReq = new HttpRequest();

        HttpResponse httpRes = new HttpResponse();

       

   //     List<LinkedIn_Data__c> linkedlnInfoListNew = [Select Id, Name,Access_Token__c,Expires_In_Seconds__c From LinkedIn_Data__c Where Name='LinkedlnInfo'];

       

        httpReq.SetMethod('GET');

        httpReq.setEndpoint('https://api.linkedin.com/v2/me');

        httpReq.setHeader('Authorization', 'Bearer '+linkedlnInfoListNew[0].Access_Token__c);

        httpReq.setHeader('Content-Type', 'application/json');

       

        try{

            httpRes = http.send(httpReq);

            if(httpRes.getStatusCode() == 200){

                Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());

                String firstName = String.valueOf(TokenInfo.get('firstName'));

                String lastName = String.valueOf(TokenInfo.get('lastName'));

                String headline = String.valueOf(TokenInfo.get('profilePicture'));

                 String prn = String.valueOf(TokenInfo.get('id'));

               

                BasicInfo = firstName +'  ' + lastName +'  '+headline+' '+prn;

               

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }catch(System.Exception e){

            System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());

            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){

                errorMessage =  'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'

                                    +' Remote Site Setting and add '+' '+ 'https://api.linkedin.com/ '+' Endpoint';

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }

    }

   

    public void doSharePostOnLinkedIn(){

   

        String errorMessage ='';

        Http http = new Http();

        HttpRequest httpReq = new HttpRequest();

        HttpResponse httpRes = new HttpResponse();

       

        List<LinkedIn_Data__c> linkedlnInfoListNew = [Select Id, Name,Access_Token__c,Expires_In_Seconds__c From LinkedIn_Data__c Where Name='LinkedlnInfo'];

       

        httpReq.SetMethod('POST');

        httpReq.setEndpoint('https://api.linkedin.com/v2/ugcPosts');

        httpReq.setHeader('Authorization', 'Bearer '+linkedlnInfoListNew[0].Access_Token__c);

        httpReq.setHeader('Content-Type', 'application/json');

        httpReq.setHeader('x-li-format' , 'json');

        httpReq.setHeader('X-Restli-Protocol-Version' , '2.0.0');

       /* String requestBody ='{'+

                                '"comment": "Check out developer.linkedin.com!",'+

                                '"content": {'+

                                    '"title": "LinkedIn Developers Resources",'+

                                    '"description": "Leverage LinkedIn’s APIs to maximize engagement",'+

                                    '"submitted-url": "https://developer.linkedin.com"'+

                                '},'+

                                '"visibility": {'+

                                    '"code": "anyone"'+

                                '}'+

                            '}';*/

 /*       String requestBody = '{'+

                            '"author": "urn:li:person:UCyVnvibic",'+

                            '"lifecycleState": "PUBLISHED",'+

                            ' "specificContent": {'+

                            '"com.linkedin.ugc.ShareContent": {'+

                            '"shareCommentary": {'+

                            '"text": "Hello World! This is my first Share on LinkedIn!"'+

                            ' },'+

                            '"shareMediaCategory": "NONE"'+

                            '}'+

                            '},'+

                            '"visibility": {'+

                            '"com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"'+

                            '}'+

                            '}';

        httpReq.setBody(requestBody);

       

        try{

            httpRes = http.send(httpReq);

            if(httpRes.getStatusCode() == 200 || httpRes.getStatusCode() == 201){

                sharedInformation = requestBody;

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Post has been shared successfully!!'));

                Map<String,object> sharedPostInformaionMap = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());

                urlToSharedPost = 'https://'+(String)sharedPostInformaionMap.get('updateUrl');

               

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }catch(System.Exception e){

            System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());

            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){

                errorMessage =  'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'

                                    +' Remote Site Setting and add '+' '+ 'https://api.linkedin.com/ '+' Endpoint';

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }else{

                errorMessage = 'Unexpected Error while communicating with LinkedIn API. '

                                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();

                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));

            }

        }

    }    */
    
}