@isTest
public class testEnqueueClass {

    @testSetup
    static void createaccountrecord()
    {
        List<account> acc = new list<account>();
        for(integer i =0;i<100;i++)
        {
            account aa = new account(name='test'+i,phone = '1313');
            acc.add(aa);
        }
        insert acc;
    }
    
    @istest 
    static void testenque()
    {
        list<account> acc = [select id,name,phone from account];
      test.startTest();
        system.enqueueJob(new queuableclass(acc));
    test.stopTest();
        List<account> acc1 = [select id,name from account];
        system.assertEquals('updated by queueuable method',acc1[0].name);
    }
}