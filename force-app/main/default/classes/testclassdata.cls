@istest(isparallel =true)
public class testclassdata {

    // @Testsetup
    static void testing()
    {
     /*   List<contact> cc= [select id,lastname from contact ];
        list<contact> cc1 = new list<contact>();
        system.debug('cccc===>'+cc.size());
        for(contact ss : cc)
        {
            ss.lastname = 'update by test class';
            cc1.add(ss);
        }
        update cc1;
        system.debug('updatename -==>'+cc1[2].lastname);*/
    }
    
    @isTest
     static void testing2()
    {
           testutilityclass.createcontact();
        List<contact> cc= [select id,lastname from contact ];
        list<contact> cc1 = new list<contact>();
        system.debug('cccc===>'+cc.size());
        for(contact ss : cc)
        {
            ss.lastname = 'update by test class';
            cc1.add(ss);
        }
        update cc1;
        system.debug('updatename -==>'+cc1[1].lastname);
    }
}