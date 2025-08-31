public   class nosharing {

     @auraenabled(cacheable=true)
    public static integer  calledbytrigger()
        
    {
     // return inheritedsharing.countacount();
     return [select id,name from account].size();
        //system.debug('enetered or not');
    }
    
     public static void  counttrigger22()
        
    {
     // return inheritedsharing.countacount();
     system.debug('let seee'+[select id,name from account].size());
        //system.debug('enetered or not');
    }
}