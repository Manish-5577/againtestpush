@RestResource(urlMapping = '/createmultipleLead/')
 global class restresourceprat {

    @HttpPost
    global static void creatleadd()
    {
        List<lead> ll  = new list<lead>();
        Restrequest rr = restcontext.request;
         String arr = rr.requestBody.toString();
 JSONParser parser =  JSON.createParser(arr);
        while(parser.nextToken() != null)
        {
            if(parser.getcurrentToken() == JSONToken.START_ARRAY)
            {
                while(parser.getcurrentToken() != null)
                {
                    if(parser.getcurrentToken() == JSONToken.START_OBJECT)
                    {
                     //  lead lol = (lead)JSON.deserialize(jsonstring,lead.class);
                       schema.Lead obj = (schema.Lead)parser.readValueAs(Lead.class);
                        ll.add(obj);
                    }
                }
            }
            
        }
        insert ll;
    }
  
  
}