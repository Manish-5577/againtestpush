public class wrapperpract {

  public static List<wrapper> pp()
  {
              List<wrapperpract.wrapper> data = new   List<wrapperpract.wrapper>();

      string jsonn = '[{"name":"mani","fname":"chaa"},{"name":"mani2","fname":"hjjjj"}]';
JSONParser parser = JSON.createParser(jsonn);
while(parser.nextToken()  != null)
{
     if((parser.getCurrentToken() == JSONToken.START_ARRAY) )
    { while(parser.nextToken() != null)
     if(parser.getCurrentToken() == JSONToken.START_OBJECT){
        System.debug('currentname '+parser.getCurrentName());
        System.debug('getText' + parser.getText());
           wrapperpract.wrapper data1 = (wrapperpract.wrapper)parser.readValueAs(wrapper.class);
                                 data.add(data1);
     }
}
      
  }
      for(wrapperpract.wrapper ww : data)
      {
          System.debug('ww==>'+ww);
      }
      return data;
  }
    
    public class wrapper
    {
        
       public string name;
        public string fname;
    }
    
}