public class handlerclassforopporunity {

    public static void mm(list<opportunity> opp, map<id,opportunity> oldOpp)
    {
        set<id> accctid = new set<id>();
        //insert undlete 
        if( oldopp == null)
        {
             for(opportunity opps : opp)
             {
                  if(!string.isblank(opps.accountid))
                  {
                      accctid.add(opps.accountid);
                  }
             }
        }
        // delete 
        else if( opp == null )
        {
            for(opportunity  opps : oldopp.values())
            {
                accctid.add(opps.accountid);
            }
        }
        else{
            
            for(opportunity oo :opp)
            {
                if(!string.isblank(oo.stagename)  && oo.stagename != oldopp.get(oo.id).stagename)
                {
                     accctid.add(oo.accountid);
                }
            }
            
        }
        
        for(Account acc : [select id,(select stagename from opportunities) from account where id in : accctid])
        {
            map<string, integer> mm = new map<string,integer>();
            for(opportunity kk : acc.opportunities)
            {
                if(mm.get(kk.stagename) != null)
                {
                    mm.put(kk.stagename, mm.get(kk.stagename) + 1);
                }
                else 
                {
                    mm.put(kk.stagename, 1);
                }
            }
            for(string ss : mm.keyset())
            {
                system.debug(ss + ' :: ' + mm.get(ss));
            }
        }
        
        
    }
    
}