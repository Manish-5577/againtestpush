@istest
public class testclassforpostalintegration {
  public static string pincode ='400097' ;  
    public static string branchname = 'mumbai';
    @istest
    static void testclassforpostalservice(){
        account mm = new account();
        mm.name = 'doremontest';
        mm.rating = 'cold';
        mm.Industry = 'agriculture';
        insert mm;
        Test.setMock(HttpCalloutMock.class, new mockcalloutforpostal());
 Httpresponse response1 =indianpostalcodeintegration.fetchdata(testclassforpostalintegration.pincode);
        indianpostalcodeintegration.getdataUsingPincodecode(testclassforpostalintegration.pincode);
//Httpresponse response2 = indianpostalcodeintegration.getdataUsingbranchname(branchname);
    }
    	
}