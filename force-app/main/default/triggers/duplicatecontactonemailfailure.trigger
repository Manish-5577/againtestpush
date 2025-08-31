trigger duplicatecontactonemailfailure on Contact (before insert) {
    if(trigger.isbefore && trigger.isinsert){
    set<string> ss = new set<string>();
    for( contact cc : trigger.new)
    {
        if(cc.email != '' && cc.email != null)
    {
        ss.add(cc.email);
    }
        
    }
  List<contact> s1 = [select id,email from contact where email in : ss];
    set<string> existingemail = new set<string>();
    if(s1.size()> 0)
    {
        for(contact s2 : s1)
        {
            existingemail.add(s2.email);
        }
    }
    for(contact fresh : trigger.new)
    {
        if(existingemail.contains(fresh.email))
        {
            fresh.addError('duplicate contact alreeady exist');
        }
    }
    }
   
}