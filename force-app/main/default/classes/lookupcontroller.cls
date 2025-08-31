public class lookupcontroller {

    @auraEnabled
    public static List<sobject> findrecord(string objectname,string fieldname, string search){
        
        string key = '%'+ search +'%'; string jj = ' limit 10 ';
    //    string Query = 'select id,'+fieldname+'from'+objectname+'where'+fieldname+'like :'+key;
        string Query = 'select id, '+ fieldname +' from '+ objectname +' where '+ fieldname +' like  ';
Query =Query +'\''+key+'\'';
        Query = Query + jj ;
system.debug('query is'+Query);
       
        List<sobject> sobjectlist = Database.query(Query);
       return sobjectlist;
    }
}