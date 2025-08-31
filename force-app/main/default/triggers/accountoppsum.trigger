trigger accountoppsum on Account (before insert,after insert,before update) {

    
 /*   if(trigger.isbefore && trigger.isupdate)
    {
        list<account> acc1 = new list<account>();
          for(aggregateresult agg : [select sum(amount) sum,accountid abc from opportunity where accountid in : trigger.newmap.keyset() group by accountid ])
          {
              account acc = new account();
              acc.id = (id)agg.get('abc');
              acc.Description = (string)agg.get('sum');
              acc1.add(acc);
          }
        if(acc1.size() >0)
        {
            update acc1;
        }
    
    }*/
}