@istest(seealldata=false)
public class testclassforupdate {
    
@istest
    public static  string testdatta(){
        
        List<account> acc1 = [select id,name from account];
        system.debug('size@$$$$'+acc1.size());
//Note : since seealldata = true hence we can fetch data from account also of database
     /*   for(account acc : acc1){
            acc.name = 'tttttt';
        }
        update acc1;*/
        return 'lalala';
    }
    
   @testsetup static  void  creatdatebase(){
        list<user> uu = [select id,name from user limit 2];

//Note : u can fetch data of user record from data base as this object are allowed to be fetched event though my seealldate = false
        for(user ee : uu){
            system.debug(ee.name);
        }

//Note:  @testsetup   we r using to create our own record for test class such that latter on in any test class we can use this record 
        List<account> ace = new List<account>();
        for(integer i =0; i<23;i++){
            account acc = new account();
            acc.name = 'testtneofortestclass'+i;
            ace.add(acc);
        }
        insert ace;
    }
 /*   @istest
    public static void testing(){
        List<account> acc1 = [select id,name from account limit 150];
 Note ::::::>  //this will fetch record from testsetup method not from the database 
        for(account acc : acc1){
            acc.name = 'testsetup 44';
        }
        update acc1;
    }*/
 /*   @testsetup static void createcontact(){
        List<user > yy = [select id,name from user limit 3];
        for(user jj :yy){
            system.debug('hahahahaaha'+jj.name);
        */
      /*  list<contact> cccc  = [select id ,name from contact];//
      Note ::::::> this will not going to give u records bcoz seealldata = true is not there hence nothing is there 
            system.debug('jdjdjdjjj'+cccc.size());
       contact cc = new contact();
        cc.lastname = 'bbbb';
        insert cc;*/
 /*   }
    }*/
  /*  @isTest static void  tttt(){
       List<contact> ccc = [select id,lastname from contact ];
        system.debug('hdhdhd'+ccc.size());
   Note ::::::>       //since we have not created any record of contact in test class hence it will not give u any record
        //in case if u mention here see alladata =true then u will get your data 
        update ccc;
    }*/

    // **********************************************************How to run test code as some other user  
@istest(seealldata=false)
    public static void runassothermethod(){
         User u2 = [SELECT Id FROM User WHERE Alias='rchau'];
        System.RunAs(u2){
            try{
            List<account> accc = [select id,name from account limit 10];
            for(account ac1 : accc){
                ac1.name = 'testas other working';
            }
                update accc;}
            catch(exception ee){
                system.debug(ee.getMessage());
                  Assert.isTrue(ee.getMessage().contains('First exception on row 0 with id 0015j00001NoKEIAA3; first error: INSUFFICIENT_ACCESS_OR_READONLY, insufficient access rights on object id: []'),'tetst ' + ee.getMessage() );
                
            }
        }
    //when this piece of code execute it will throw error 
    //Update failed. First exception on row 0 with id 0015j00001NoKEIAA3; first error: INSUFFICIENT_ACCESS_OR_READONLY, insufficient access rights on object id: []
   //reason being now test class is running as other user which we have mentioned in above query i.e 'rchau' and this user 
   //this user dont have access to account object 
    }
    @istest(seealldata=false)
    public static void runasssystemadminmethod(){
         User u2 = [SELECT Id FROM User WHERE Alias='mchau'];
        System.RunAs(u2){
            try{
            List<account> accc = [select id,name from account limit 10];
            for(account ac1 : accc){
                ac1.name = 'testas other working';
            }
                update accc;}
            catch(exception ee){
                system.debug(ee.getMessage());
                  Assert.isTrue(ee.getMessage().contains('First exception on row 0 with id 0015j00001NoKEIAA3; first error: INSUFFICIENT_ACCESS_OR_READONLY, insufficient access rights on object id: []'),'tetst ' + ee.getMessage() );
                
            }
        }
   
    }
    // testing for negative scenario i.e we are updating account with industry equals to banking in our org we have validation i.e account with industry equal to banking not allowed 
      @istest(seealldata=false)
    public static void negativescenario(){
        try{
            List<account> accc = [select id,name from account limit 10];
            for(account ac1 : accc){
                ac1.name = 'testas other working';
                ac1.industry = 'Banking';
                // Assert.fail('DmlException expected');
            }
                update accc;}
            catch(exception ee){
                system.debug(ee.getMessage());
                Assert.areEqual('FIELD_CUSTOM_VALIDATION_EXCEPTION', ee.getDmlStatusCode(0));
             
Assert.isTrue(ee.getMessage().contains('First exception on row 0 with id 0015j00001NoKEIAA3; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Industry banking is not allowed while creation: []'),'tetst ' + ee.getMessage() );                
          
        }
   
    }
    @istest(seealldata = false)
    public static void callaccount()
    {  system.debug('executeet@@@@&***');
     list<account> acc = [select id from account ];
        system.debug('size===>without see all data false'+acc.size());
    }
    
    
}