@RestResource(urlMapping ='/leadfirsteg22/*')
global with sharing  class restapiwithshaaringtest {

    
    @HttpGet
   global   static integer mm(){
       return [select id from lead ].size();
   }
    
    @HttpPost
    global static DefinedType createRecord(DefinedType record) {
        return record;
    }
    
    global class DefinedType {
        /* accepted */
        private String name;
        private Decimal height;
        private String description;
        /* accepted */
        private transient String random1; //ignored
  //  global static String random2; //ignored
    }
}