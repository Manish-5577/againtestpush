trigger duplicatelead on Lead (before insert) {

    //set<string> ss = new set<string>();
    set<string> company = new set<string>();
    set<string> email = new set<string>();
    for(lead ll : trigger.new)
    {
      company.add(ll.company);
      email.add(ll.email);
        
    }
    map<string,lead> exstlead = new map<string,lead>();
    map<string,lead> exstlead2 = new map<string,lead>();
    for(lead jj : [select id,name,company,email from lead where company in : company and email in : email ])
    {
       
        exstlead.put(jj.company,jj);  
        exstlead2.put(jj.email,jj);
    }
    for(lead kk : trigger.new)
    {
        if(exstlead.get(kk.company) != null)
        {
            kk.adderror('duplicate lead found!!!!!!!');
        }
         if(exstlead.get(kk.email) != null)
        {
            kk.adderror('duplicate lead found!!!!!!!!!!!!!!!!');
        }
    }
}