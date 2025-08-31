public class searchlookup {

     @AuraEnabled
    public static List<sObject> search(String objectName, List<String> fields, String searchTerm){
        String searchKeyword = searchTerm + '*';
        system.debug('searchKeyword'+searchKeyword);
        String returningQuery = '';
        system.debug('fields ==>'+fields);
        returningQuery = objectName+' ( Id, '+String.join(fields,',')+')';
        String query = 'FIND :searchKeyword IN ALL FIELDS RETURNING '+returningQuery+' LIMIT 5';
        system.debug('final query'+query);
        List<List<sObject>> searchRecords = new List<List<sObject>>();
        List<SObject> sobjList = new List<SObject>();
        if(String.isBlank(searchTerm)){
            system.debug('kyu enter hua @@@@@');
            String soqlQuery = 'SELECT Id, Name, Type, LastViewedDate FROM RecentlyViewed WHERE Type =\''+objectName+'\' ORDER BY LastViewedDate DESC LIMIT 5';
            sobjList = Database.query( soqlQuery );
            searchRecords.add(sobjList);
        }else{
            searchRecords = Search.Query(Query);
            system.debug('search record==>'+searchRecords);
        }
        system.debug('what is at 0 index'+searchRecords.get(0));
        return searchRecords.get(0);
}
     @AuraEnabled
    public static sObject getRecentlyCreatedRecord(String recordId, List<String> fields, String objectName){
        sObject createdRecord;
        try {
            String query = 'SELECT Id, '+String.join(fields,',')+' FROM '+objectName+' WHERE Id = \''+recordId+'\'';
            List<SObject> sobjList = Database.query( query );
            createdRecord = sobjList.get(0);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return createdRecord;
    }
    
}