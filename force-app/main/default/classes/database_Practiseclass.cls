public class database_Practiseclass {    
    public static void queryrecord ()
    {  system.debug('called in apex classs##################'+trigger.isExecuting);
        string query = 'select count() from account';callinginherited.callinginheritedss();
        integer i = database.countquery(query,accesslevel.user_mode);
        system.debug('result of user mode query==>iii'+i);
        integer y = database.countquery(query);
                system.debug('result of user mode query==>y'+y);
        integer z = database.countquery(query,accesslevel.system_mode);
        system.debug('result of user mode query==>z'+z);

    }
    public static void deleterecord(list<lead> ll)
    {
       
    }
    
}