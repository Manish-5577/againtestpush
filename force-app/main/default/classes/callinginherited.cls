public  with sharing class callinginherited {
    public static boolean stopp = true;
 @auraenabled(cacheable=true)
    public static integer callinginheritedss()
    {          system.debug('current context of code@@@@@'+trigger.isExecuting);
        system.debug('size of total account'+inheritedsharing.countacount());
        return inheritedsharing.countacount();
    }
}