@istest
public class testclass2 {

    @testsetup
    public static void preparedrecord()
    {list<account> cc1 = new list<account>();
        
        for(integer i =0;i<501;i++)
        {
            account aacc =  new account();
            aacc.name = 'battt'+i;
            aacc.rating = 'cold';
            cc1.add(aacc);
        }
     insert  cc1;
     for(account acc : cc1)
     {
         Test.setCreatedDate(acc.Id, DateTime.newInstance(2012,12,12));
     }
    }
    
      @istest()
    public static void tt()
    {  
    }
    @istest(seealldata =false)
      public static void tt1()
    {for(account acc : [select id,createddate from account ])
    {
        system.debug('accc crewateddate '+acc.createddate);
    }
     list<account> acc = [select id,createddate from account ];
      system.assertequals(acc[0].CreatedDate, DateTime.newInstance(2012,12,12));
    /*    test.starttest();
        databasestateful dd = new databasestateful();
        database.executebatch(dd,20);*/
        batchclasspract dd1 = new batchclasspract();
        database.executebatch(dd1,2000);
       databasestateful dd2 = new databasestateful();
        database.executebatch(dd2,2000);
      /*  databasestateful dd3 = new databasestateful();
        database.executebatch(dd3,2000);
        databasestateful dd4 = new databasestateful();
        database.executebatch(dd4,2000);
        databasestateful dd5 = new databasestateful();
        database.executebatch(dd5,2000);
        databasestateful dd6 = new databasestateful();
        database.executebatch(dd6,2000);
        databasestateful dd7 = new databasestateful();
        database.executebatch(dd7,2000);
        batchclasspract bb42 = new batchclasspract();
        database.executebatch(bb42,2000);*/
     //   test.stoptest();
        
    //    list<account> acc = [select id,name from account ];
     //   string dd1 = acc[0].name + 'statefulupdate';
     //   system.assertequals(dd1,acc[0].name);
    /*       databasestateful dd12 = new databasestateful();
        database.executebatch(dd12,2000);*/
        
       databasestateful dd11 = new databasestateful();
        database.executebatch(dd11,2000);
           databasestateful dd111 = new databasestateful();
        database.executebatch(dd111,2000);
           databasestateful dd1111 = new databasestateful();
        database.executebatch(dd1111,2000);
           databasestateful dd11111 = new databasestateful();
        database.executebatch(dd11111,2000);
     batchone b1 = new batchone();
     database.executebatch(b1,2000);
     batchtwo bb2 = new batchtwo();
     database.executebatch(bb2,2000);
     batchthree bbb34 = new batchthree();
     database.executebatch(bbb34,2000);
     batchfour b444 = new batchfour();
     database.executebatch(b444,2000);
      //  system.assertequals(4,databasestateful.ccc);
    }
}