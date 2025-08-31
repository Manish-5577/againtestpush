trigger databasetrigger on Lead (before insert,before update) {

    
  database_Practiseclass.queryrecord();
  
     //  database_Practiseclass.deleterecord(trigger.new);
     for(lead lld : trigger.new)
     {     system.debug('true@@@@@@@@@@@'+trigger.isExecuting);
   //   lead ld = [select id from lead where id = '00Q5j00000aLYb7EAG'];
       string query =  'select  count() from lead where leadsource =\'Web\'';
         database.countquery(query,accesslevel.user_mode);
    /*     try{
             Database.DeleteResult dd= Database.delete(ld,true,accesslevel.user_mode);
         }
catch(exception ee)
{   throw new DmlException('REASON FOR ERROR IS 🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️🤦‍♂️'+ee.getMessage());
        //  system.debug('exception reasonn'+ ee.getMessage());
        
}*/
     }
   
}