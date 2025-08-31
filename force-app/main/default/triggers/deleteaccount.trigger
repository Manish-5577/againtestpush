trigger deleteaccount on Account (before delete) {
 
    
  if(trigger.isbefore && trigger.isdelete){
    for(account ff : trigger.new)
    {
        if(UserInfo.getFirstName() == 'manish')
        {
            ff.adderror('u cant delete acclunt');
        }
    }

}
}