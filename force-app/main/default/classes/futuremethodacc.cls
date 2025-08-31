public class futuremethodacc {
 //  public static boolean ff = true;    
      public static void updateacc(string ace){
       
          account acc = [select id,name,rating,phone from account where id =:ace];
           acc.phone ='12345';
           update acc;
          }
    
    public static void insertaccount (){
        
        for( integer i =151 ;i<300;i++)
        {  system.debug('no of time execution');
            account acc = new account();
            acc.name ='testdml'+i;
            acc.rating = 'hot';
            acc.phone = '1111'+i;
            insert acc;
        }
        
    }
       
    
}