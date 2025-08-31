trigger leadformulatest on Lead (before insert) {

  /*  map<string, id> storedevelpnameandid = new map<string, id>();
    for(group gg : [select id,developername from group ])
    {
        storedevelpnameandid.put(gg.developername,gg.id);
    }
    for(lead cc : trigger.new)
    {
        string ss =  cc.company + 'tera logic to get string from customer';
    cc.ownerid = storedevelpnameandid.get(ss);
    }*/
}