public class testingprocessbuilder {
@invocablemethod(label ='withoutparameter')
    public static list<account> testtt(list<sobject> ss)
    { try{
        return [select id from account limit 1];
    }
     catch(exception ee)
     {
         system.debug(ee.getMessage() + ee.getCause() + ee.getTypeName());
     }
     return  [select id from account limit 1];
    }
}