@istest
public class testclass4 {

    
      @testsetup
    public static void preparedrecord()
    {list<case> cc1 = new list<case>();
        
        for(integer i =0;i<88;i++)
        {
            case cc = new case();
            cc.status = 'new';
            cc.origin = 'phone';
            cc1.add(cc);
            
        }
     insert  cc1;
     for(case cc : cc1)
     {
         Test.setCreatedDate(cc.Id, DateTime.newInstance(2014,9,25));
     }
   
    }
    
    
    @istest
    public static void hhh()
    {
      /*  List < sObject > ls = Test.loadData(Case.sObjectType, 'tesstt'); 

       
         Case c = (Case) ls[0]; 
         system.debug('ls===>'+c.createddate );
        list<case> cc = [select id,lastmodifieddate,createddate from case where id =: c.id ];
        system.debug('#######'+cc);
        system.assertequals(ls.size(),2);*/
        
     /*     String caseJSON = '{"attributes":{"type":"CasSe","url":"/services/data/v25.0/sobjects/Case/500E0000002nH2fIAE"},"Id":"500E0000002nH2fIAE","Status":"Open","CreatedDate":"2012-10-04T17:54:26.000+0000","lastmodifieddate": "2012-10-04T17:54:26.000+0000"}'; 
        Case c = (Case) JSON.deserialize(caseJSON, Case.class); 
        System.debug('Test case:' + c.createdDate); 
         System.debug('Test last modifed datecase:===>' + c.lastmodifieddate); 
        System.debug('Test caseId:' + c.Id); 
        System.debug('Test caseStatus:' + c.status); 
list<case> cc = [select id,lastmodifieddate,createddate from case where id =: c.id ];
        system.debug('#######'+cc);
        Case c1 = new Case(); 
        c1.Id = c.Id; 
        c1.status = 'New'; 
        update c1; */

        //System.debug('Test caseStatus1:' + c1.status); 
    }
    
     @istest()
    public static void tt()
    {  
         for(case acc : [select id,createddate,LastModifiedDate from case limit 50])
         {
               system.debug(acc);
             acc.status = 'rating';
         //   Expected: 2012-12-11 18:30:00, Actual: 2013-12-11 18:30:00
              list<case> dd = [select id,createddate,LastModifiedDate from case limit 50];
             system.debug('@@@@@@===>'+dd[5].LastModifiedDate);
        system.debug('jdjdjjdjd'+acc.createddate + 'lastmodifieddate '+ acc.LastModifiedDate);
        System.assertEquals(acc.CreatedDate, DateTime.newInstance(2013,12,12));
          
           //  update acc;
         }
    }
    @istest(seealldata =false)
      public static void tt1()
    {
         for(case acc : [select id from case  limit 50])
         {
              system.debug(acc);
             acc.status = 'rating';
             update acc;
         }
    }
}