public class jsongeneratorclasseg {

    public static void jsontesting()
    {
        List<account> mm = [ select id,name,phone,industry,rating from account limit 5];
        string jsonn =   json.serialize(mm[0]);
        System.debug(jsonn);
        
        account jj = (account)json.deserialize(jsonn, account.class);
        system.debug(jj);
        
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
                string jsongenerator = gen.getAsString();
                system.debug('json string '+ jsongenerator);
            }
            
            
            
        
        
      
    }
}