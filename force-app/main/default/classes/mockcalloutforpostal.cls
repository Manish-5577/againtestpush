@istest
global class mockcalloutforpostal  implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest request) {
 HttpResponse response = new HttpResponse();
 response.setHeader('Content-Type', 'application/json');
//response.setBody('{"Name":"Malad East","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","Block":"Malad East","State":"Maharashtra","Country":"India","Pincode":"400097"}');
response.setBody('{"Message":"Number of pincode(s) found:2","Status":"Success","PostOffice":[{"Name":"Malad East","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","Block":"Malad East","State":"Maharashtra","Country":"India","Pincode":"400097"},{"Name":"Rani Sati Marg","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","Block":"Malad East","State":"Maharashtra","Country":"India","Pincode":"400097"}]}');
        response.setStatusCode(200);
 return response; 

 }

}