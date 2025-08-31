trigger userlogin on User (before insert,before update,after update) {

    if(trigger.isafter && trigger.isupdate){
    for(user hh :trigger.new)
    {
        if(hh.logincount__c != trigger.oldmap.get(hh.id).logincount__c){
            PermissionSetAssignment mm = new PermissionSetAssignment();
            
            mm.PermissionSetId = '0PS5j000006fB4NGAU';
            mm.AssigneeId = hh.id;
            insert mm;
        }
    }
    }
}