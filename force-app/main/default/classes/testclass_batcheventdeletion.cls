@istest
public class testclass_batcheventdeletion {

    @testsetup
    public static void testdata(){
        event_organizer__c eo = new event_organizer__c();
        eo.name = 'manish test';
        eo.phone__c = '3434342';
        eo.email__c = 'manishchaudhary19990@gmail.com';
        eo.alternative_phone__c = '234234323123';
        eo.alternative_email__c =  'dhkjdhk@gmail.com';
        insert eo;
        
        List<event__c> ee = new list<event__c>();
        for(integer i =0; i<401;i++){
              event__c event = new event__c( Name__c = 'tetette'+i,
                                      event_organizer__c = eo.id,
                                      event_type__c = 'virtual',
                                      frequency__c = 'weekly',
                                      max_seats__c =220,
                                      recurring__c = true,
                                      live__c = true,
                                      start_datetime__c = system.now().addmonths(-4),
                                      end_date_time__c = system.now().adddays(3).addmonths(-4));
            ee.add(event);
        }
      
       
        insert ee;
    }
    @istest
    static void sendatafordeleteionusingbatch(){
        system.debug('size==>'+[select id from event__c].size());
       test.startTest();
  string jobid =     database.executeBatch(new batcheventdeletion(),500);  
        test.stoptest();
        
        test.startTest();
 account mm = new account();
        mm.name = 'tetssts';
        insert mm;
        test.stoptest();
        
       system.assertEquals('finish',batcheventdeletion.ss);
           system.debug('let see==>'+batcheventdeletion.totalcount);
        
    }
  /*    @istest
    static void sendatafordeleteionusingbatch2(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }
      @istest
    static void sendatafordeleteionusingbatch3(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }
      @istest
    static void sendatafordeleteionusingbatch4(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }
      @istest
    static void sendatafordeleteionusingbatch5(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }
      @istest
    static void sendatafordeleteionusingbatch6(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }  @istest
    static void sendatafordeleteionusingbatch7(){
        
        test.starttest();
  string jobid =     database.executeBatch(new batcheventdeletion(),203);
        test.stoptest();
    }*/
    
}