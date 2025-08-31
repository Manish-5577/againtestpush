@RestResource(urlMapping ='/leadfirsteg/*')
global class resteghttGet {

    @HttpGet
   global  static integer mm(){
        RestRequest req = RestContext.request;
        system.debug('req ==>'+RestContext.request);
       futuretest.ttt();
       integer i =0;
 //     string      mm  = 'manish';  compare above line with this line restcontex.request = data = manish to hold data we need some datatype=> string is used to hold manish same way to hold request we need restrequest
        RestResponse res = RestContext.response;// sameway restresponse is used to access response data
     /*    List<account> mm = [ select id,name,phone,industry,rating from account limit 5];
       string jsondata ;
                if( mm.size() >0 && mm != null){
        JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject();
            gen.writeFieldName('Allaccount');
            gen.writeStartArray();
            for(account acc : mm)
            {
                    gen.writeStartObject();
              string accname =   acc.Name!=NULL?acc.Name:'';
   
                    gen.writeStringField('NAME', accname);
                  string accId = acc.id != Null?acc.id:'';
                    gen.writeStringField('Id', accId);
                  string accrating = acc.rating != Null?acc.rating:'';
                  gen.writeStringField('Rating', accrating);
                  string accIndustry = acc.industry != Null?acc.industry:'';
                  gen.writeStringField('Industry', accIndustry);
                  string Phone = acc.phone != Null?acc.phone:'';
                gen.writeStringField('Phone',Phone);
                gen.writeEndObject();
            }
                gen.writeEndArray();

    gen.writeEndObject();
                 jsondata = gen.getAsString();
             //   system.debug('json string '+ jsondata);
                  
            }
        return jsondata;  */
      /*  string fieldname,fieldvalue ;
        system.debug('req.requestURI'+req.requestURI);
        system.debug('headers'+req.headers);
          system.debug('httpMethod==>'+req.httpMethod);
        system.debug('params==>'+req.params);
            system.debug('remoteAddress==>'+req.remoteAddress);
        system.debug('requestBody==>'+req.requestBody.toString());
         system.debug('requestURI==>'+req.requestURI);
          system.debug('resourcePath==>'+req.resourcePath);
        System.debug('responseBody==>'+res.responseBody);
        System.debug('statusCode==>'+res.statusCode);
         System.debug('headers==>'+res.headers);
        string requestURI = req.requestURI;       
        string leadName ='%'+requestURI.substring(requestURI.lastIndexOf('=')+1)+'%';
        system.debug('leadName'+leadName);
        list<lead> leadlist = [SELECT Id,Name,Email,Phone,Company,MobilePhone from lead where Name like :leadName];
     
     System.debug('responseBody==>'+res.responseBody);
string arr = req.requestBody.toString();
    JSONParser parser =  JSON.createParser(arr);*/
    /*   lead leaaa = (lead)JSON.deserialize(arr,lead.class);
       leaaa.ownerid = '0055j000007eNLfAAM';
       insert leaaa;
       system.debug('lead using deserialize ==>'+leaaa);*/
   /*     while(parser.nextToken() != null)
        {  System.debug('parser nextToken'+parser.nextToken());
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {System.debug('parser.getCurrentToken()'+parser.getCurrentToken());
                fieldname = parser.getCurrentName();
             System.debug('parser.getCurrentName()'+parser.getCurrentName());
                fieldvalue = parser.getText();
              System.debug('parser.getText()'+parser.getText());
                if(fieldname == 'name')
                {
                   system.debug('enter loop 1');
                    
                }
                else if(fieldname == 'firstname')
                {
 system.debug('enter loop 2');
                }
                else if(fieldname == 'lastname'){
                     system.debug('enter loop 3');
                }
            }
}


        return leadlist;
*/
    
   
    return [select id from lead limit 50001].size();
  
    }
    
    @HttpDelete
    global static string deletelead()
    {  integer count = 0;string response;
          
     system.debug('UserInfo.getFirstName();'+UserInfo.getFirstName());
     try{restrequest req = restcontext.request;
            restresponse res = restcontext.response;
        string urldeletename =  req.requestURI;
        system.debug('urldeletename'+urldeletename);
        string leadname = '%'+urldeletename.substring(urldeletename.lastIndexOf('=')+1)+'%';
        list<lead> ll = [select id,name,email from lead where name like :leadname];
         if(ll.size()>0  && ll != null)
         {
             
              
             count = ll.size();
         }
       delete ll;
         response ='no of lead deleted is '+count;
        }
     
     catch( exception ee)
     {
         response = 'reason lead not deleted is '+ ee.getMessage();
     }
        
     return response;
    }
    
  /* @HttpPost
    global static void insertlead(string lastname, string firstname, string phone, string company , string email  )

    { system.debug('tetetettetet!!!!'+ lastname + 'firstsnM'+ phone + 'company '+ company +  'email' + email);
        restrequest req = restcontext.request;
    system.debug('input paramter '+lastname);
     system.debug('requestBody==>'+req.requestBody.tostring());*/
        // string ids ;
    /*    try{
            restrequest req = restcontext.request;
            system.debug('restcontext.request===>'+restcontext.request);
       //     system.debug('req  requestt==>'+ req.requestBody.toString()+'77777777777'+req.requestURI);
        system.debug('requestURI==>'+req.requestURI);
          //   sharingtesting.useofstripinaccessible();
          system.debug('resourcePath==>'+req.resourcePath);
              lead ll = new lead();
                 ll.firstname = firstname;
         ll.lastname = lastname;
        ll.phone = phone;
        ll.company = company;
        ll.email = email;
        insert ll ;
            ids = ' succesfully  lead created with id :::::>'+ll.id;
        }
     catch(exception cc){
         ids = 'error occured due to this::::>'+cc.getMessage();
     }*/
  /*        system.debug('req.requestURI'+req.requestURI);
        system.debug('headers'+req.headers);
          system.debug('httpMethod==>'+req.httpMethod);
        system.debug('params==>'+req.params);
     for(string ss : req.params.keyset())
     {
         system.debug(ss + ':' +req.params.get(ss) );
     }
     
            system.debug('remoteAddress==>'+req.remoteAddress);
        //system.debug('requestBody==>'+req.requestBody.tostring());
         system.debug('requestURI==>'+req.requestURI);
          system.debug('resourcePath==>'+req.resourcePath);
     
        string requestURI = req.requestURI;  
   //   sharingtesting.createelead(lastname,firstname,phone,company,email );
    }*/
    
    @HttpPatch
    global static map<string,string> updatemail (string newemail,string phone,map<string,integer> hh){
        string response;
        system.debug('hhh@@@@@'+hh);
        map<string,string> mapp = new map<string,string>();  string gg;
        system.debug('newemail'+ newemail + 'phone' + phone);
        try{ restrequest req = restcontext.request;
        restresponse  res = restcontext.response;
          
        string requesturl = req.requestURI;
        //    system.debug('what is request body'+req.requestbody.tostring());
        string leadid =    requesturl.substring(requesturl.lastIndexOf('=')+1);
        lead mm = [select id,name,email,phone from lead where id=:leadid];
        if(mm.email != newemail)
        {
            mm.email = newemail;
            update mm;
            response ='email of lead has been updated from old email to'+mm.email;
        }
        else{
            response = 'new email is same as old email';
        }
           }
        catch(exception ce)
        {
            response='error occured due to this reason::::>'+ ce.getMessage();
        }
         mapp.put('response',response);
        mapp.put('randomtest',gg);
        mapp.put('ttttt',gg);
       return mapp;
    }
      @HttpPut
    global static string updatemailee (string newemail){
        string response;
        try{ restrequest req = restcontext.request;
        restresponse  res = restcontext.response;
        string requesturl = req.requestURI;
        string leadid =    requesturl.substring(requesturl.lastIndexOf('=')+1);
        lead mm = [select id,name,email,phone from lead where id=:leadid];
        if(mm.email != newemail)
        {
            mm.email = newemail;
            update mm;
            response ='email of lead has been updated from old email to'+mm.email;
        }
        else{
            response = 'new email is same as old email';
        }
           }
        catch(exception ce)
        {
            response='error occured due to this reason::::>'+ ce.getMessage();
        }
       
        return response;
    }
    
    global class wrapper2
    {
        
       @auraenabled public string accnmae;
        @auraenabled public list<contact> cc;
        @auraenabled public list<opportunity> oppp;
        
        wrapper2(list<contact> cc, list<opportunity> opp, string name)
        {
            this.accnmae = name;
            this.cc = cc;
            this.oppp = opp;
        }
        
    }
    @httppost
    global static string wrappertest()
    {
        restrequest rr = restcontext.request;
        system.debug(rr.requestBody.tostring());
     return rr.requestBody.tostring();
    }
    
   /*  
/*  restRequest rr = restcontext.request;
        
          JSONParser parser = JSON.createParser(rr.requestBody.tostring());
               parser.nextToken();
                while(parser.nextToken()!=NULL){
                   // system.debug('parser necttoken '+parser.nextToken()+'token value'+parser.getcurrentToken()+parser.getCurrentName());
                             
                     if(parser.getcurrentToken() == jsontoken.START_ARRAY){
                         while(parser.nextToken()!=NULL){ 
                              system.debug('5555555'+parser.getCurrentName());
                             if(parser.getcurrentToken() ==  jsontoken.START_OBJECT){
                             //e3    system.debug('5555555'+parser.getCurrentName());
                    wrapper2 postall = (wrapper2)parser.readValueAs(wrapper2.class);
               //   postalcodewrapper postall  = (postalcodewrapper)System.JSON.deserialize(hresp1.getBody(), postalcodewrapper.class);
                             system.debug(postall);
                                
                             /*    if(parser.getCurre1ntName() == 'Pincode'){
                                     mm =mm+1 ;
                                     system.debug('getText'+parser.getText()+ '@@@@@@');
                                 }*/
         /*                          system.debug('covid19===>'+postall); 
                             }
                         }
                     }
                     
                }*/


}