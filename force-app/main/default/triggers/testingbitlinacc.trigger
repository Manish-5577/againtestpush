trigger testingbitlinacc on Account (after insert,before update) {

    if(trigger.isafter && trigger.isinsert){
    for(account mm :trigger.new){
       string kk = mm.id;
   //   bitlywebservicecalloutissueontriger.callbitly(kk);
        bitlytesting.getshortlink(kk);
    }
    }
}