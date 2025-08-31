public class covidIntegration {

    
        @AuraEnabled
    public static list<COVID19CountrySummary> getCOVID19Summary(){
        list<COVID19CountrySummary> COVID19Summary = new list<COVID19CountrySummary>();
    //    String accToken;
    //    string responseBody;
        string endPoint='https://jsonplaceholder.typicode.com/posts';
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
    hresp1=h1.send(req1);

      //  system.debug('***hresp1.getBody()'+hresp1.getBody());
        JSONParser parser = JSON.createParser(hresp1.getBody());
         while (parser.nextToken() != null){    
           //  system.debug('nextToken :::=>'+parser.nextToken());
             if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                   // system.debug('getcurrenttoken **=>'+parser.getCurrentToken());
                 while (parser.nextToken() != null) {
                  //   system.debug('parser.nextTOken 222one=>'+parser.nextToken());
                      if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                            system.debug('JSONToken.START_OBJECTis ==>'+JSONToken.START_OBJECT);
                          COVID19CountrySummary covid19 = (COVID19CountrySummary)parser.readValueAs(COVID19CountrySummary.class);
                          system.debug('65555covid19==>'+covid19);
                          if(string.isNotBlank(covid19.userId)){
                              system.debug('covid19 data is '+covid19);
                          COVID19Summary.add(covid19);
                          }

                      }

                 }                }

         }
         //lets chcek total for all

         if(COVID19Summary.size()>0){
             system.debug('covid19 size is '+COVID19Summary.size());
             string countryName='World Total';
             integer NewConfirmedTotal= 0;
       
             integer userids= 0;
          
         
             integer TotalRecoveredTotal= 0;
            for(COVID19CountrySummary eachCountry :COVID19Summary){
                NewConfirmedTotal = NewConfirmedTotal+Integer.valueof(eachCountry.id); 
                system.debug('newconfirmedtotal is '+NewConfirmedTotal+'Integer.valueof(eachCountry.id);++>'+Integer.valueof(eachCountry.id));
                userids  = userids + Integer.valueof(eachCountry.userId); 
                       system.debug('total userid is '+userids+'Integer.valueof(eachCountry.userid);++>'+Integer.valueof(eachCountry.userId));
         
            }

            COVID19CountrySummary totalSummary = new COVID19CountrySummary();
            totalSummary.userId = countryName;
             system.debug('one is');
      //      totalSummary.CountrySlug = countryName;
    //        totalSummary.NewConfirmed = string.valueOf(NewConfirmedTotal);
         //   totalSummary.TotalConfirmed = string.valueOf(TotalConfirmedTotal);
       //     totalSummary.title = string.valueOf(NewDeathsTotal);
         //   totalSummary.TotalDeaths = string.valueOf(TotalDeathsTotal);
        //    totalSummary.body = string.valueOf(NewRecoveredTotal);
      //      totalSummary.TotalRecovered = string.valueOf(TotalRecoveredTotal);
          //  system.debug('***totalSummary'+totalSummary);
           COVID19Summary.add(totalSummary );

         }

        system.debug('***COVID19Summary  size'+COVID19Summary.size());
        return COVID19Summary;
    }

   

    public class COVID19CountrySummary{

         @AuraEnabled
      public string userId;
  //     @AuraEnabled
  //    public string CountrySlug;
       @AuraEnabled
      public string id;
     //  @AuraEnabled
  //    public string TotalConfirmed;
     @AuraEnabled
     public string title;
    //   @AuraEnabled
    //  public string TotalDeaths;
       @AuraEnabled

      public string body;

       @AuraEnabled
      public string TotalRecovered;
        
        
    /*    "userId": Country
        "id": 4,NewConfirmed
        "title": "eum et est occaecati",NewDeaths
           "body     NewRecovered  */
    }

   
    
}