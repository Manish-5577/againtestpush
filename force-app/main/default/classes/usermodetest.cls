public without sharing class usermodetest {

   
    public static void withusermode()
    {
        system.debug('account size without user mode in without sharing!!!!!'+[select id from account ].size());
                system.debug('account size with user mode without sharing !!!!!'+[select id from account with user_mode].size());        
    }
    
   @auraenabled public string abc;
    @auraenabled public integer xyz;
    @auraenabled public string kkll;
   
}