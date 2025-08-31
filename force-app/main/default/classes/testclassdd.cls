public class testclassdd {

    
    public static void sam()
    {

        account mm = new account(name = 'new acc');
         insert mm ;
        contact cc = new contact( lastname = 'doe',accountid = mm.id);
        insert cc;
        task newtask = new task (subject= 'hjdhjd', whatid = cc.id,description = 'jhdsjd');
        database.insert(newtask);
        
        
    }
}