public class mixeddmlerror {

    
    public static void mixdmlerr()
    {
        contact cc = new contact();
        cc.lastname = 'mix dml test';
        insert cc;
        
       user uu = [select id,name from user where username = 'csncdd@34.com'];
        uu.email = 'updatedde@gmail.com';
        update uu;
    }
}