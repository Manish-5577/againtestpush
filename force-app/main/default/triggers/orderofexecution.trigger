trigger orderofexecution on Account (before delete) {

    for(account acc : trigger.old)
    {
       // acc.adderror('error messag ein beofre trigggger flow');
    }
}