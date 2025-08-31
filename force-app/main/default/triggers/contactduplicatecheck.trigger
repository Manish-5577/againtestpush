trigger contactduplicatecheck on Contact (after insert) {
    
    set<string> ss = new set<string>();
  
 /*   for(contact cc : trigger.new)
    {
        if(ss.contains(cc.email))
        {
            cc.adderror('duplicate detected');
        }
        else
        {
            ss.add(cc.email);
           
        }
    }*/
  //  map<id,contact > cc = new map<id,contact> ([select id,email from contact where email in : ss]);
   
    list<messaging.singleemailmessage> ll = new list<messaging.singleemailmessage>();
    for(contact jj : trigger.new)
    {
        if(string.isblank(jj.lastname ))
        {
           // jj.adderror('duplicate detected@@@@@@@@@');
        }
       else{
            messaging.singleemailmessage sem = new messaging.singleemailmessage ();
            list<string> ss = new list<string>{'manishchaudhary19990@gmail.com'};
                list<string> hh = new list<string>{'cpunaram35@gmail.com'};
            sem.setToAddresses(ss);
            sem.setCcAddresses(hh);
            sem.setSubject('single test!!!!!!!!!');
            sem.setPlainTextBody('testing single email message@@@@@@@@@@@@@@@@@@@@');
            ll.add(sem);
        }
          messaging.singleemailmessage sem = new messaging.singleemailmessage ();
          
             sem.settargetobjectid(jj.id);
        sem.setSaveAsActivity(false);
            sem.setSubject('single test!!!!!!!!!');
            sem.setPlainTextBody('testing single email message@@@@@@@@@@@@@@@@@@@@');
            ll.add(sem);
    }
    if(ll.size()>0){
        messaging.sendemail(ll);
    }
     
    
    

}