trigger futurecall on Account (after update) {

    set<id> ss = new set<id>();
    for(account mm : trigger.new)
    {
         ss.add(mm.id);
    }
   
}