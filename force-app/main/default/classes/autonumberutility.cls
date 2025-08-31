public class autonumberutility { 
    public  static  map<Id,recordType> OppRecordTypeMap = new map<Id,recordType>();
    public static Map<String, autonumberutility__c> allSettings = autonumberutility__c.getAll();
    public static integer i =0;
    public static void loadreferencedata()
    {
        for(RecordType  recType : [select id,name,DeveloperName,SobjectType,BusinessProcessId,CreatedDate,
                                   LastModifiedDate from RecordType ])
        {
            OppRecordTypeMap.put(recType.Id, recType);
        }    
    }   
    public static void autonumberlogic(list<sobject> opplist)
    {       
        /*   autonumberutility__c  AuNo = [select id,Format__c,LastNumber__c,Length_of_AutoNumber__c,
* Object_APi_Name__c,recordType__c from autonumberutility__c 
where Object_APi_Name__c = 'Opportunity' and recordType__c = 'Business_Opportunity' limit 1 for update ]; 
integer latestnumber =  Integer.valueof(AuNo.LastNumber__c) == null  ? 0 : Integer.valueof(AuNo.LastNumber__c) ;
string autonumber ;*/
        /*    map<string, list<sobject>> mm = new map<string, list<sobject>>();
for(sobject opp : (list<sobject>)opplist)
{  
Id recordTypeId = (Id)opp.get('RecordTypeId'); 
if(allSettings.get(OppRecordTypeMap.get(recordTypeId).developerName)!= null)
//    if(objNameMetadataMap.get('recordtypeexist').restricted_Record_Type__c.contains(
//    OppRecordTypeMap.get(recordTypeId).developername))
{
if(mm.get(OppRecordTypeMap.get(recordTypeId).developername) == null)
{
mm.put(OppRecordTypeMap.get(recordTypeId).developername, new list<sobject>());
}
mm.get(OppRecordTypeMap.get(recordTypeId).developername).add((sobject)opp);
}
}     
system.debug('onee'+mm);
// utilitytest((map<string,List<sobject>>)mm, 'Name');       */
    }
    
    
    public static void optimise(list<sobject> sobjList , string fieldname, string objectname , integer retrialattempt)
    {
        for(sobject record : sobjList )
        {Id recordTypeId = (Id)record.get('RecordTypeId');
         if(OppRecordTypeMap.get(recordTypeId) != null)
         {           
             record.put(fieldname,'By default');      
         }
        }
    }
    Public static void optimiseAfterInsert(list<sobject> sobjList , string fieldname, string objectname, integer retrialtime )
    {try{
        
        Map<String, autonumberutility2__c> recTypeAutoNumRecMap = new map<String, autonumberutility2__c>();
     map<string, integer> recTypeLastNoMap = new map<string, integer>();
     list<autonumberutility2__c> autoNumlistToUpd = new list<autonumberutility2__c>();
     List<Sobject> ss = new List<sobject>();
     List<String> sobjIdSet = new List<string>();
     for(sobject sobjRec :sobjList)
     {sobjIdSet.add('\''+ string.valueof(sobjRec.get('Id')) + '\'');
     }  
    String idListStr = String.join(sobjIdSet,',');    
     for(autonumberutility2__c  autoNum : [select id,Name,Format__c,Lastnumber__c,Length_of_AutoNumber__c,
                                           Object_APi_Name__c,recordType__c from autonumberutility2__c 
                                           where  Object_APi_Name__c =:objectname  for update ])
     {
         recTypeAutoNumRecMap.put(autoNum.name,autoNum);
     }
     loadreferencedata();
     String query = 'SELECT Id,RecordTypeId,' + fieldname + ' FROM ' + ' ' + objectname +' ' + ' WHERE Id IN ( ' + idListStr + ')' ;
     system.debug('query ==>'+query);
     for(sobject record : Database.query(query)) {                              
         system.debug('record==>'+record);
         string autonumber ='';
         Id recordTypeId = (Id)record.get('RecordTypeId');
         if(recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername) != null){
             if(recTypeLastNoMap.get(OppRecordTypeMap.get(recordTypeId).developername) == null)
             {
                 recTypeLastNoMap.put(OppRecordTypeMap.get(recordTypeId).developername,
                                      (integer)recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Lastnumber__c);
             }
             integer lastnumber = recTypeLastNoMap.get(OppRecordTypeMap.get(recordTypeId).developername)+ 1;
             string paddedno =  String.valueof(lastnumber).Leftpad(
                 integer.valueof(recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Length_of_AutoNumber__c), '0');
             autonumber = recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Format__c + ' - ' + paddedno ;
             System.debug('autonumber!!!'+autonumber);
             record.put(fieldname,autonumber);      
             System.debug('is it coming line 62 !!'+autonumber);
             recTypeLastNoMap.put(OppRecordTypeMap.get(recordTypeId).developername,lastnumber);
             ss.add(record);
             System.debug('is it coming !! line 64'+autonumber + 'recTypeLastNoMap value ==>' + recTypeLastNoMap);
         }
     }
     for(string keys : recTypeLastNoMap.keyset() )
     {
         autonumberutility2__c autoNumRec = new autonumberutility2__c();
         autoNumRec.id = recTypeAutoNumRecMap.get(keys).id;
         autoNumRec.Lastnumber__c = recTypeLastNoMap.get(keys);
         autoNumlistToUpd.add(autoNumRec);       
     }
     if(autoNumlistToUpd.size() >0)
     {system.debug('line 81autoNumlistToUpd==>'+autoNumlistToUpd);
      update autoNumlistToUpd;
      for (Integer i = 0; i < 1000000; i++) {
    Double d = Math.sqrt(i); // simulate processing
}
      system.debug('line 83autoNumlistToUpd==>'+autoNumlistToUpd);
     }if(ss.size()> 0)
     {
         update ss;
     }
    }
    
    catch(exception ee)
    {
    if(ee.getMessage().contains('UNABLE_TO_LOCK_ROW') || ee.getMessage().contains('Record Currently Unavailable'))
    {   datetime dd = datetime.now();
datetime ddTenSecAdded = dd.addseconds(10);
string mm = string.valueof(dd.addseconds(10));
String sec = string.valueof(ddTenSecAdded.second());
String min = string.valueof(ddTenSecAdded.minute());
String hour = string.valueof(ddTenSecAdded.hour());
String day = string.valueof(ddTenSecAdded.day());
String month = string.valueof(ddTenSecAdded.month());
String year = string.valueof(ddTenSecAdded.year());
String sch = '20 30 8 10 2 ?';
string cronexpre = sec + ' ' + min + ' ' + hour + ' ' + day  + ' ' + month + ' ' +'?' + ' ' + year;
     integer ii = retrialtime ;
     system.debug('ii retrial attempt ==>'+ii);
Schedulerclass m = new Schedulerclass(sobjList,objectname,fieldname,ii); 
     String jobID = System.schedule('retrial test' + mm  , cronexpre, m); 
         system.debug('exception mssg ==>'+ee.getmessage() + 'get causee ==>'+ee.getCause() + 'get line ==>'+ee.getLineNumber());
    }
        
    }
    }
}

/* public static void optimiseafterInsert(list<sobject> sobjList , string fieldname, string objectname , integer retrialattempt)
{
for(autonumberutility2__c  autoNum : [select id,Name,Format__c,Lastnumber__c,Length_of_AutoNumber__c,
Object_APi_Name__c,recordType__c from autonumberutility2__c 
where  Object_APi_Name__c =:objectname  for update ])

}*/
/* Map<String, autonumberutility2__c> recTypeAutoNumRecMap = new map<String, autonumberutility2__c>();
loadreferencedata();
try{
for(autonumberutility2__c  autoNum : [select id,Name,Format__c,Lastnumber__c,Length_of_AutoNumber__c,
Object_APi_Name__c,recordType__c from autonumberutility2__c 
where  Object_APi_Name__c =:objectname  for update ])
{recTypeAutoNumRecMap.put(autoNum.name,autoNum);}
list<autonumberutility2__c> autoNumlistToUpd = new list<autonumberutility2__c>();
map<string, integer> recTypeLastNoMap = new map<string, integer>();string autonumber ='';
for(sobject record : sobjList )
{Id recordTypeId = (Id)record.get('RecordTypeId');
if(recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername) != null){
if(recTypeLastNoMap.get(OppRecordTypeMap.get(recordTypeId).developername) == null)
{
recTypeLastNoMap.put(OppRecordTypeMap.get(recordTypeId).developername,
(integer)recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Lastnumber__c);
}
integer lastnumber = recTypeLastNoMap.get(OppRecordTypeMap.get(recordTypeId).developername)+ 1;
string paddedno =  String.valueof(lastnumber).Leftpad(
integer.valueof(recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Length_of_AutoNumber__c), '0');
autonumber = recTypeAutoNumRecMap.get(OppRecordTypeMap.get(recordTypeId).developername).Format__c + ' - ' + paddedno + userinfo.getName();   
System.debug('autonumber!!!'+autonumber);
record.put(fieldname,autonumber);      
System.debug('is it coming line 62 !!'+autonumber);
recTypeLastNoMap.put(OppRecordTypeMap.get(recordTypeId).developername,lastnumber);
System.debug('is it coming !! line 64'+autonumber + 'recTypeLastNoMap value ==>' + recTypeLastNoMap);
}
}
for(string keys : recTypeLastNoMap.keyset() )
{
autonumberutility2__c autoNumRec = new autonumberutility2__c();
autoNumRec.id = recTypeAutoNumRecMap.get(keys).id;
autoNumRec.Lastnumber__c = recTypeLastNoMap.get(keys);
autoNumlistToUpd.add(autoNumRec);       
}
if(autoNumlistToUpd.size() >0)
{  system.debug('line 81autoNumlistToUpd==>'+autoNumlistToUpd);
update autoNumlistToUpd;
system.debug('line 83autoNumlistToUpd==>'+autoNumlistToUpd);
}
}
catch(Exception ex)
{ 
system.debug('Error Occured !!! at Line '+ ex.getLineNumber() + '  '  + 'Error Reason ' + ex.getMessage());
if(retrialattempt < 3)
{ retrialattempt++;
system.debug('retrialattempt line 93'+retrialattempt);
//  system.enqueuejob(new autonumberutilityqueuable(sobjList,objectname,fieldname,retrialattempt));
datetime dd = datetime.now();
datetime ddTenSecAdded = dd.addseconds(10);
string mm = string.valueof(dd.addseconds(10));
String sec = string.valueof(ddTenSecAdded.second());
String min = string.valueof(ddTenSecAdded.minute());
String hour = string.valueof(ddTenSecAdded.hour());
String day = string.valueof(ddTenSecAdded.day());
String month = string.valueof(ddTenSecAdded.month());
String year = string.valueof(ddTenSecAdded.year());
String sch = '20 30 8 10 2 ?';
string cronexpre = sec + ' ' + min + ' ' + hour + ' ' + day  + ' ' + month + ' ' +'?' + ' ' + year;
Schedulerclass m = new Schedulerclass(sobjList,objectname,fieldname,retrialattempt);        
String jobID = System.schedule('retrial test' + mm  , cronexpre, m); 
system.debug('job id '+jobID);
//  autonumberutilityqueuable abc = new autonumberutilityqueuable(sobjList,objectname,fieldname,retrialattempt);
//  system.enqueuejob(abc);
}

}*/

/*    public static void  utilitytest(map<string,list<sobject>> nn,string fieldname )
{
Map<String, autonumberutility__c> allSettings = new Map<String, autonumberutility__c>();
for(autonumberutility__c anu : [select id,Name,Format__c,Lastnumber__c,Length_of_AutoNumber__c,
Object_APi_Name__c,recordType__c from autonumberutility__c   for update ])
{
allSettings.put(anu.Name,anu);
}
list<autonumberutility__c> ll = new list<autonumberutility__c>();
for(string abc : nn.keyset())
{Integer lastno = (integer)allSettings.get(abc).Lastnumber__c;
string autonumber = '';
for(sobject ss : nn.get(abc))
{lastno++;
string paddedno =  String.valueof(lastno).Leftpad(integer.valueof(allSettings.get(abc).Length_of_AutoNumber__c), '0');
autonumber = allSettings.get(abc).Format__c + ' - ' + paddedno;         
ss.put(fieldname,autonumber);
}
autonumberutility__c anu = new autonumberutility__c();
anu.Lastnumber__c = lastno;
anu.Id = allSettings.get(abc).Id;
anu.Name = abc;
ll.add(anu);     
}
if(ll.size()> 0)
{
update ll;
}
}
*/