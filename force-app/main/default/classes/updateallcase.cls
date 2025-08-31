public  class updateallcase {


    public static void updatteccase()
    {
        
        list<case> cc = [select id,description  from case ];
        system.debug('cc size is ===>'+cc.size());
        for(case  ff : cc)
        {
            ff.description = 'updated via scedule class';
        }
        update cc;
    }
}