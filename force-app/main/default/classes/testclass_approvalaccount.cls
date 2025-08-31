@istest
public class testclass_approvalaccount {
@istest
    public static void approvaltestclass(){
        account mm = new account();
      mm.name = 'tettete';
    mm.rating ='hot';
    mm.Website = 'https://dev.bitly.com/api-reference/#createBitlink';
    insert mm;
       //  note here if u run this class u will get an error like 
       //     Methods defined as TestMethod do not support Web service callouts
   // hence to avoid this we  have to make mock callout 
        
    }
}