Global class soapgetlead {

    @Readonly
    webservice  static list<lead> fetchlead(string names)
    {     string l = '%'+names+'%';
        List<lead> ll = [select id,name,email from lead where name like : l];
   /*  for(lead lol : ll)
     {
         lol.lastname = lol.lastname +'.';
     }
     update ll;*/
        return ll;
    }
      @Readonly
    webservice static list<lead> fetchlead2(string names)
    {     string l = '%'+names+'%';
        List<lead> ll = [select id,name,email from lead where name like : l];
   /*  for(lead lol : ll)
     {
         lol.lastname = lol.lastname +'.';
     }
     update ll;*/
        return ll;
    }
}