public with sharing class usermodetestwithsharing {

    
      public static void withusermode()
    {
        system.debug('account size with sharing '+[select id from account with user_mode ].size());
        
    }
}