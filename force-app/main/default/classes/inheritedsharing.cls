public inherited sharing class inheritedsharing {  
    @auraenabled(cacheable=true)
    public static integer countacount(){
           List<account> upp = new list<account>();
        system.debug('test class');
       List<account> acc1 = [select id from account ];
        System.debug('testing=====================>'+acc1.size());
    return acc1.size();
    }
}