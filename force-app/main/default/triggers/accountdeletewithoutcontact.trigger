trigger accountdeletewithoutcontact on Account (before delete) {

    if(trigger.isbefore && trigger.isdelete)
    {  
        for(contact ss : [select id,accountid from contact where accountid in : trigger.oldmap.keyset()])
        {
           Trigger.oldmap.get(ss.accountid).adderror('Account associated with contact are not allowed to delete ');
        }
    }
   
}