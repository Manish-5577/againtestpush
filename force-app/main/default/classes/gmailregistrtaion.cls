global class gmailregistrtaion implements Auth.RegistrationHandler {
    
    global User createUser(id portalId,Auth.UserData data)
    {
        User userDet =[Select id,name,email,username from user where email =:data.email limit 1];
        system.debug('user'+userDet);
        return userDet;
    }
    global void updateuser(id userid,id portalid,Auth.UserData data)
    {
        
    }
    

}