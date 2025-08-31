@isTest(isparallel =true)
public class testbitlypart2 {
static testMethod void testPostCallout() {
account mm = new account();
    mm.name = 'tettete';
    mm.rating ='hot';
    mm.Website = 'https://dev.bitly.com/api-reference/#createBitlink';
    insert mm;
  /*   account m1 = [select id,name,rating from account where id=: mm.id];
        m1.name = 'jdjjdj';
        update m1 ;*/
 
    test.startTest();
Test.setMock(HttpCalloutMock.class, new testclass_bitly());
   bitlytesting.getshortlink(mm.id);
   
  
//String strResp = AnimalLocator.getAnimalNameById(2);
 test.stopTest();
 account m1 = [select id,name,rating from account where id=: mm.id];
        m1.name = 'jdjjdj';
        update m1 ;
   
}


    
    
}