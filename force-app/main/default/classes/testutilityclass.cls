@istest
public class testutilityclass {

 
    @istest
   public  static void  createcontact()
    {
        contact cc = new contact();
        cc.lastname = 'testuitility1';
        cc.phone = '21314';
        insert cc;
         contact cc1 = new contact();
        cc1.lastname = 'testuitility22';
        cc1.phone = '21314';
        insert cc1;
    }
}