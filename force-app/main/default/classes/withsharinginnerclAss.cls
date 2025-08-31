public with sharing   class withsharinginnerclAss {

  //  public  list<test1__mdt> metadata  = [select id from 	test1__mdt];
    
    public with sharing class   sharingg
    {
        
 public  integer  outerclasstesting()
    {
        return [select id from account].size();
    }
    }

     public static  integer  outerclasstesting22()
    {
        return [select id from account].size();
    }
  
    public static void metadaatacount()
    {
        list<test1__mdt> metadata  = [select id from 	test1__mdt]; 
        system.debug('metadata size####'+metadata.size());
        
    }
  
}