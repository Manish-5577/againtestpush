public class Accountutilityclasshandler {

    
    public static void accaccountnoutility(list<account> acc)
    {
        map<string, list<account>> mm = new map<string, list<account>>();
        for(account opp : acc)
        {
            if(autonumberutility.objNameMetadataMap.get('AccounttypeExist').restricted_Record_Type__c.contains(autonumberutility.OppRecordTypeMap.get(opp.recordTypeid).developername))
            {
                if(mm.get(autonumberutility.OppRecordTypeMap.get(opp.recordTypeid).developername) == null)
                {
                    mm.put(autonumberutility.OppRecordTypeMap.get(opp.recordTypeid).developername, new list<account>());
                }
                mm.get(autonumberutility.OppRecordTypeMap.get(opp.recordTypeid).developername).add(opp);
            }
        }
        
        system.debug('onee'+mm);
        autonumberutility.utilitytest((map<string,List<sobject>>)mm, 'Name');
    }
}