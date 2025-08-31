public class jsonapexclass {

    public static void deserialise()
    {
        String  jsonstring = '{"firstname":"mania2","lastname":"minia","email":"maniaminiaad@gmail.com"}';
       Contact cc = (Contact)JSON.deserializeStrict(jsonstring,contact.class);
        insert cc;
    }
    public static void deserialisepart2()
    {
     String jsonInput =    '{\n' +
    ' "description" :"An appliance",\n' +
    ' "accessories" : [ "powerCord", ' + 
      '{ "right":"door handle1", ' + 
        '"left":"door handle2" } ],\n' +
    ' "dimensions" : ' + 
      '{ "height" : 5.5 , ' + 
        '"width" : 3.0 , ' + 
        '"depth" : 2.2 },\n' +
    ' "type" : null,\n' +
    ' "inventory" : 2000,\n' +
    ' "price" : 1023.45,\n' +
    ' "isShipped" : true,\n' +
    ' "modelNumber" : "123"\n' +
    '}';
    }
    
}