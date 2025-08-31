public class bulkintegrationbatchclass implements database.batchable<sobject>{

    list<account> accotoupd = new list<account>();
    public database.querylocator start(database.batchablecontext bc )
    {
        return database.getquerylocator('select id,name,rating from account');
    }
    public void execute(database.batchablecontext bc, list<account> acc)
    {list<accouwrap> accww = new list<accouwrap>();
     
        for(account ac : acc)
        {
            accouwrap  accwrap = new accouwrap(ac.id,ac.name,ac.rating);
            accww.add(accwrap);
        }
     string abc =  JSON.serialize(accww) ;
     system.debug(abc);
     
     list<accouwrap> acccc = (list<accouwrap>)JSON.deserialize(abc,List<accouwrap>.class );
     system.debug('size() ==>'+acccc.size());
//     Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(abc);
  integer i = 0 ;
     for(accouwrap ww : acccc)
     {
          account acc1 = acc[i];
         acc1.name =  ww.ids + ':' + 'old accountid ' + ':' + acc1.id;
         acc1.id = ww.ids;
         acc1.rating = ww.rating;
         acc1.BillingCity = 'updtaed todaayyy';
         i++;
          accotoupd.add(acc1) ;
     }
     update accotoupd;
    }
    public void finish(database.batchablecontext bc)
    {
        
    }
   public class accouwrap
   {
       public string ids;
       public string name;
       public string rating;
       public accouwrap(string id, string name, string rating)
       {
           this.ids = id;
           this.name = name;
           this.rating = rating;
       }
   }
    
}