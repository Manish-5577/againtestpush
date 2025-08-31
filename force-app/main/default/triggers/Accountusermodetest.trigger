trigger Accountusermodetest on Account (before insert,after insert) {

    
     usermodetest.withusermode();
    usermodetestwithsharing.withusermode();
      system.debug('account size in trigger without user mode !!!!! '+[select id from account  ].size());
          system.debug('account size in trigger with user mode !!!!! '+[select id from account with user_mode ].size());

    
}