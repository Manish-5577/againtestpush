public class DynamicRenderinglogic {
    
    
    @auraenabled
    public static list<ObjectsFieldsList__mdt> fieldListToRender()
    {
        try{
            return [select id,Label,FieldsapiName__c,Dependency_check__c from ObjectsFieldsList__mdt];
        }
        catch(exception ee)
        {
            throw new AuraHandledException('Something went wrong: ' + ee.getMessage());       
        }
    }
    @auraenabled
    public static list<wrapervalidationErrorMssg> fetchvalidationaError()
    {try{
        
        list<wrapervalidationErrorMssg>   wvemList = new list<wrapervalidationErrorMssg>();
        map<id,Validationcheck__mdt> valicheckMap = new map<id,Validationcheck__mdt>([select id,fieldToConsider__c,Field_Api_Name__c,max_length__c,
                                                                                      min_Length__c,Object_Name__c
                                                                                      from Validationcheck__mdt  ]);
        map<id,Error_Message__mdt> errorMap = new map<id,Error_Message__mdt>();
        for(Error_Message__mdt em : [select id,max_length__c,min_Length__c,Validationcheck__c from Error_Message__mdt])
        {
            errorMap.put(em.Validationcheck__c, em);
        }
        for(Id vc : valicheckMap.keyset())
        {
            wrapervalidationErrorMssg wvem = new wrapervalidationErrorMssg();
            wvem.FieldApiName = valicheckMap.get(vc).Field_Api_Name__c;
            wvem.validationRec = valicheckMap.get(vc);
            wvem.errorMssgRec =  errorMap.get(vc) == null ? null :  errorMap.get(vc);
            wvem.objectApiName = valicheckMap.get(vc).Object_Name__c;
            wvemList.add(wvem);
            // wvemMap.put((string)wvem.FieldApiName,wvem);
        }
        return wvemList;
    }
     catch(exception ee)
     {
         throw new AuraHandledException('Something went wrong: ' + ee.getMessage());      
     }
    }
    
    
    public class wrapervalidationErrorMssg
    {
        @auraenabled 
        public  string fieldApiName;
        @auraenabled 
        public  string objectApiName;
        @auraenabled 
        public  Validationcheck__mdt  validationRec;
        @auraenabled
        public   Error_Message__mdt  errorMssgRec;
    }
}