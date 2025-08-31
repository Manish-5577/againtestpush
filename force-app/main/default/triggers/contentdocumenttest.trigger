trigger contentdocumenttest on ContentDocument (after insert) {
    set<id> ss = new set<id>();  String objectName = '';map<string,string> mm = new map<string,string>();
    system.debug('tetsst'+trigger.newmap.keyset());
    for(ContentDocumentlink cc : [select ContentDocumentId,LinkedEntityId from contentdocumentlink where ContentDocumentId in : trigger.newmap.keyset()])
    {              system.debug('testtt');
        objectName = cc.LinkedEntityId.getSObjectType().getDescribe().getName();
        system.debug('object name ==>'+objectname);
        if(objectName  == 'Contact')
        {
            mm.put(cc.ContentDocumentId,cc.LinkedEntityId);
        }objectName = '';
        
    }
    for(contentversion cv  : [ select ContentDocumentId,ContentSize from Contentversion where ContentDocumentId  in : mm.keyset() ])
    {
        if(cv.ContentSize > 1000)
        {  system.debug('comingg22222222');
         cv.adderror('blalalallaalla');
        }
    }
    
    
}