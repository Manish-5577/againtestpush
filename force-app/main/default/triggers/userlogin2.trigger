trigger userlogin2 on LogoutEventStream (after insert) {

    for(LogoutEventStream kk : trigger.new)
    {
       List<PermissionSetAssignment> pp = [select id,PermissionSetId,Assignee.id,Assignee.name from PermissionSetAssignment   where  PermissionSetId ='0PS5j000006fB4NGAU'];
        
        delete pp;
        account jojo = new account();
        jojo.name = 'youuuuuuu';
        insert jojo;
        
    }
    
}