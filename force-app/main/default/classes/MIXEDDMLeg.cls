public class MIXEDDMLeg {

    
    public static void mixeddmlerror(){
        
      contact cc = new contact(lastname='testmixeddml',email='tets@Kjkddhmail.com');
insert cc;
  Profile p = [SELECT Id FROM Profile WHERE Name='Standard Platform User'];
      //  UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];

   User u = new User(alias = 'cchau', email='chaudhary@gmail.com', 
            emailencodingkey='UTF-8', lastname='chaudhary', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id,
            timezonesidkey='America/Los_Angeles', 
                     username='csncdd@34.com');
        insert u;
    }
}