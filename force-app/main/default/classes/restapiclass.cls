@RESTResource(urlMapping ='/createLead/')
global with sharing  class restapiclass {
@HTTPPost
    global static  string creatingLedRecord()
    {
        string fname,lname,comp;string resposne;
        string fieldname,fieldvalue;
        	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String arr = req.requestBody.toString();
        system.debug('@@@@@'+res);
                system.debug('@@@@@'+req);
        system.debug('value gotis '+arr);
        JSONParser parser =  JSON.createParser(arr);
        while(parser.nextToken() != null)
        {  System.debug('parser nextToken'+parser.nextToken());
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {System.debug('parser.getCurrentToken()'+parser.getCurrentToken());
                fieldname = parser.getCurrentName();
             System.debug('parser.getCurrentName()'+parser.getCurrentName());
                fieldvalue = parser.getText();
              System.debug('parser.getText()'+parser.getText());
                if(fieldname == 'lastname')
                {
                    lname = fieldvalue;
                    
                }
                else if(fieldname == 'firstname')
                {
                      fname = fieldvalue;
                }
                else if(fieldname == 'company'){
                    comp = fieldvalue;
                }
            }
        }
       lead ll = new lead(lastname=lname,firstname =fname,company =comp);
        try{
             insert ll;
            resposne = ll.id;
        }
       catch(exception e)
       {
           resposne = e.getmessage();
           System.debug('resposne===>'+resposne);
       }
        return resposne;
    }
}