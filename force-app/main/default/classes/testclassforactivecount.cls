@IsTest(SeeAllData=false)
public class testclassforactivecount {
    
    
  @TestSetup
    public static void createtestdata()
    {list<account> acc = new list<account>();
     List<user> uu = [select id,name from user ];
     for(user dd : uu)
     {
         system.debug('dd=>'+dd.name);
     }
     contact ddd = new contact();
     ddd.LastName ='jengo';
     ddd.Email = 'ask@kdld.com';
     insert ddd;
          Account mm= new account(name ='testclassprep',phone ='445');
     Account m1= new account(name ='testclassp3',phone ='445');
     Account m2= new account(name ='testclasspr344',phone ='445');
     Account m3= new account(name ='testc7465',phone ='445');
     acc.add(mm);acc.add(m1);acc.add(m2);acc.add(m3);
     insert acc;
     List<contact> cc = new list<contact>();
     cc.add(new contact(lastname = 'test1',accountid =acc[0].id,donotcall = true));
     cc.add(new contact(lastname = 'tesuut1',accountid =acc[1].id,donotcall = true));
     cc.add(new contact(lastname = 'test991',accountid =acc[1].id,donotcall = true));
     cc.add(new contact(lastname = 'test876781',accountid =acc[0].id,donotcall = true));
     insert cc;
    }
    @isTest(SeeAllData=false)
    public static void checktestsetupworkingorNOT()
    {account acc1 = new account();
     acc1.name = 'testing';
     acc1.rating = 'hot';
     insert acc1;
    
        list<protetedd__c> pp = [select id from protetedd__c];
system.debug('custom setting daattatat'+pp);
         list<test1__mdt> pp1 = [select id from test1__mdt];
system.debug('custom metadat@@@ daattatat'+pp1);
        list<account> accco = [select id,name from account ];
        System.debug('acccco size is===>'+accco.size());
        for( account acc : accco)
        {
            if(acc.name == 'testclassprep')
            {
                system.assertEquals(2,acc.ActiveCountContact__c);
            }
        }
    }
    
 @isTest(SeeAllData=false)
    public static void activecontactupdate()
    {  list<account> acc = new list<account>();
      list<account> accco1 = [select id,name,ActiveCountContact__c from account ];
        System.debug('acccco1 size is===>'+accco1.size());
     Account mm= new account(name ='testclassprep');
     Account m1= new account(name ='testclassp3');
     Account m2= new account(name ='testclasspr344');
     Account m3= new account(name ='testc7465');
     acc.add(mm);acc.add(m1);acc.add(m2);acc.add(m3);
     insert acc;
     List<contact> cc = new list<contact>();
     cc.add(new contact(lastname = 'test1',accountid =acc[0].id,donotcall = true));
     cc.add(new contact(lastname = 'tesuut1',accountid =acc[1].id,donotcall = true));
     cc.add(new contact(lastname = 'test991',accountid =acc[1].id,donotcall = true));
     cc.add(new contact(lastname = 'test876781',accountid =acc[0].id,donotcall = true));
     insert cc;
     List<ACCOUNT> accer = [select id,ActiveCountContact__c,name from account];
     for(account accef : accer)
     {
         if(accef.name == 'testclassprep')
         {
             system.assertequals(2,accef.ActiveCountContact__c);
             system.debug('$$$$$$$$$$%555==>'+accef.ActiveCountContact__c);
         }
     }
     // system.debug('ActiveCountContact__c'+acc[0].ActiveCountContact__c );
     //  system.assertequals(2,acc[0].ActiveCountContact__c);
     system.assertequals(4,cc.size());
     system.assertequals(true,cc[0].donotcall);
     // account dd = acc[0];
     
    }
    @isTest(SeeAllData=false)
    public static  void afterinserthandlerbulkcheck()
    {
         list<account> accco2 = [select id,name,ActiveCountContact__c from account ];
        System.debug('acccco2 size is===>'+accco2.size());
        List<Account> acc = new List<account>();
        list<contact> cc = new list<contact>();
        acc.add(new account(name='acctest'));
        acc.add(new account(name='acctest2'));
        insert acc;
        for( integer i =0;i<300;i++)
        {
            cc.add(new contact(lastname='cctest'+i,accountid= acc[0].id,donotcall =true));
            
        }
        cc.add(new contact(lastname='cctest11',accountid =acc[1].id,donotcall =false));
        cc.add(new contact(lastname='cctdfsdft11',accountid =acc[1].id,donotcall =false));
        cc.add(new contact(lastname='cctestdfsdf11',accountid =acc[1].id,donotcall =false));
        insert cc;
        List<ACCOUNT> accer = [select id,ActiveCountContact__c,name from account];
        for(account ack : accer)
        {
            if(ack.name =='acctest')
            {
                system.assertequals(300,ack.ActiveCountContact__c);
            }
        }
        
    }
    
    @isTest
    public static void afterupdatecasefieldonaccoutn()
    {
        List<account> acc = new List<account>();
        acc.add(new account(name='testclasasa',phone='12345'));
        acc.add(new account(name='tes7888',phone='8888888'));
        insert acc;
        List<contact> con = new list<contact>();
        for(integer i =0;i<40;i++)
        {
            con.add(new contact(lastname='testcon'+i,phone='8988'+i,accountid = acc[0].id));
            
        }
        insert con;
        list<account> ach = [select id,name,phone from account where name ='testclasasa' or name ='tes7888'];
        for(account acf : acc)
        {
            
            acf.phone = '33333';
            system.debug('account id '+acf.id);
            
        }
        test.startTest();
        update  ach;
        test.stopTest();
        
         test.startTest();
        update  ach;
        test.stopTest();
        for(account acf1 : acc)
        {
            
           system.debug('let see updated valyue of account'+acf1.phone);
            
        }
        List<contact> ccup = [select id,phone,accountid from contact where lastname ='testcon0' or lastname ='testcon1' or lastname ='testcon2'];
       for(contact cc : con)
       {
     //     if(cc.lastname == 'testcon0')
       //    {
            //   system.assertEquals('333339090',cc.phone);
               system.debug('cc.phone===>'+cc.phone+ cc.accountid);
       //   }
       }
        
    }
    
    
    
    
}