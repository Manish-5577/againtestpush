@istest
global class testclass_bitly implements HttpCalloutMock {

global HTTPResponse respond(HTTPRequest request) {
 HttpResponse response = new HttpResponse();
 response.setHeader('Content-Type', 'application/json');
response.setBody('{"created_at":"2023-10-05T17:50:23+0000","id":"bitly.is/3LP2fE7","link":"https://bitly.is/3LP2fE7","custom_bitlinks":[],"long_url":"https://dev.bitly.com/api-reference/#createBitlink","archived":false,"tags":[],"deeplinks":[],"references":{"group":"https://api-ssl.bitly.com/v4/groups/Bn9m9QruHBr"}}');
 response.setStatusCode(200);
 return response; 

 }


    
}