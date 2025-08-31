trigger sessioninfo on Case (before insert) {

    
    system.debug('session iddidid==>'+UserInfo.getOrganizationId() + UserInfo.getSessionId().substring(15));
}