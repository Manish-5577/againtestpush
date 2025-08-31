trigger taskcontact on Contact (after delete, before delete) {
    system.debug('after delete test');
   for(task tt : [select id,Whoid  from task where whoid in : trigger.oldmap.keyset()])
   {
       system.debug('tt id '+ tt.Whoid );
   }

}