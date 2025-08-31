trigger testingscenario on Contact (before insert,after insert,before update,after update ) {

    
 /*  if(trigger.isupdate && trigger.isbefore)
    {
      //   testingscenarioo.testt();
       HttpRequest req = new HttpRequest();
     req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
     req.setMethod('GET');
          Http http = new Http();
     HTTPResponse res = http.send(req);

    }
       if(trigger.isupdate && trigger.isafter)
    {    system.debug('donee');
         testingscenarioo.testt();
        system.debug('done22');

    }*/
 /*   if(trigger.isinsert && trigger.isbefore)
    {
      //   testingscenarioo.testt();
       HttpRequest req = new HttpRequest();
     req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
     req.setMethod('GET');
          Http http = new Http();
     HTTPResponse res = http.send(req);

    }*/
      if(trigger.isinsert && trigger.isafter)
    {
  // testingscenarioo.testt();
    /*   HttpRequest req = new HttpRequest();
     req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
     req.setMethod('GET');
          Http http = new Http();
     HTTPResponse res = http.send(req);
*/
    }
    
}