trigger leaddexception on Lead (after update) {

    contact cc = [select id,lastname from contact limit 1];
cc.lastname = 'mixdml test';
update cc;
user uu = [select id,isactive from user where id ='0055j000008BUIrAAO'];
uu.isactive = false;
update uu;
    
 /*  for(lead ll :trigger.new)
   {
       try{
       if(ll.email != '')
       {
           throw new abcException('hureeeeeeeeee!!!!!!!!!!!!!!!!!!!!');
       }
       }
       catch(abcException ee)
       {
           system.debug('testing@#############');
           system.debug(ee.getmessage());
         // system.debug('@@$$$$$$$$$$'+abcException.testt(ee));
           contact cc = new contact();
           cc.lastname = 'created after exception@@@@ ';
           cc.email = 'exception@jddd.com';
           insert cc;
       }
       
       
   }*/
}