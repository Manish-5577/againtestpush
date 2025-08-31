@isTest
public class testclass_weatherapi {

    @isTest(seealldata = true)
        public static void testweather()
        {
   insert new contact(lastname ='manitt',email = 'hghg@gfg.com',phone ='98987');
            contact cc1 = [select id,mailingcity from contact limit 1];
      //    test.starttest();
             
 	  Test.setMock(HttpCalloutMock.Class, new mockweatherapi());
             weatherapi.sentrequesttoweatherapi(cc1.MailingCity,cc1.Id);
          //  indianpostalcodeintegration.fetchdata('400097');

//          Test.stopTest();
           //  weatherapi.sentrequesttoweatherapi(cc.MailingCity,cc.Id);
      /*   Test.startTest();
         Test.setMock(HttpCalloutMock.Class, new mockweatherapi());
          weatherapi.sentrequesttoweatherapi(cc.MailingCity,cc.Id);
          Test.stopTest();*/
         /*     Test.startTest();
            databasestateful dd = new databasestateful();
            database.executebatch(dd,50);
             Test.stopTest();*/
              
          //  contact cc1 = [select id,mailingcity from contact limit 1];
          //  Test.setMock(HttpCalloutMock.Class, new mockweatherapi());
            
  
             
          /*   contact cc2 = new contact();
            cc2.LastName = 'testcontcat';
            cc2.Email = 'manish@gffmail.com';
            cc2.MailingCity = 'newyork';
            insert cc2;
            */
         /*   contact cc1 = [select id,mailingcountry from contact limit 1];
            cc1.mailingcountry = 'inn';
            update cc1;*/
         //   system.assertequals('us',cc1.MailingCountry);
                  
        }
    
    public class  mockweatherapi implements HttpCalloutMock
    {
        
        public HTTPResponse respond(HTTPRequest request){
        HTTPResponse resp = new HTTPResponse();
      
         resp.setStatusCode(200);
            resp.setBody('{"coord":{"lon":72.8479,"lat":19.0144},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":91.38,"feels_like":87.8,"temp_min":85.89,"temp_max":91.38,"pressure":1016,"humidity":21},"visibility":3000,"wind":{"speed":6.91,"deg":260},"clouds":{"all":77},"dt":1706424428,"sys":{"type":1,"id":9052,"country":"us","sunrise":1706406232,"sunset":1706446720},"timezone":19800,"id":1275339,"name":"Mumbai","cod":200}');
          return resp;
    }
        
    }
    
}