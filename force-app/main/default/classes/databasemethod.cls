public class databasemethod {

    
    public static void databasepract(){
  /*      List<account> ll = new List<account>();
        account mm = new account();
        mm.name = 'testdatabase1';
        account nn = new account();
        
        ll.add(mm);
        ll.add(nn);
        database.saveresult[] insertlist = database.insert(ll,false);
        for(database.saveresult sr : insertlist){
            if(sr.isSuccess()){
                system.debug('recordsavedsuccessfully'+sr.getId());
            }
            else {
                for(database.error err : sr.getErrors()){
                    system.debug(err.getstatusCode() + ':' + err.getMessage() );
                    system.debug('account field that affected this error '+err.getFields());
                }
            }
        }
        
        List<account> acc = [select id,name,industry,rating from account limit 10];
        for(account kk : acc){
            kk.name = kk.name+'one update database';
        }

       database.saveresult[] updatelist = database.update(acc,false);
        for( database.saveresult test : updatelist){
            if(test.isSuccess()){
                system.debug('record update successfully'+ test.getId());
            }
            else {
                for(database.error err : test.getErrors()){
                            system.debug(err.getstatuscode() + ':'+err.getmessage());
                    system.debug('account field that affected this error'+err.getFields());
                }
            }
        }*/
        List<contact> cc1 = new list<contact>();integer count =0;integer count2 =0;
        List<string> ids =  new List<string>{'0035j00001C3ecYAAR','0035j00001C3ecXAAR','0035j000019Oih3AAC'};
        List<contact> cc = [select id,lastname from contact where id in : ids];
        for(contact kk  : cc){
            string name = kk.lastname;
            system.debug('name is '+name);
                if(name.containsIgnoreCase('salesforce')){
                    system.debug('test1looop');
                    kk.lastName = kk.lastname + 'databaseupsert';
                    system.debug('test1looop22');
                    count = count +1;
                   // cc1.add(kk);
                    
                }else {
                    contact cec = new contact();
                    cec.lastname = 'salesforce testt788888';
                    system.debug('testupsertloop');
                    count2 = count2 +1 ;
                    
                   cc1.add(cec);
                }
           cc1.add(kk);
        }
   system.debug('count is ===>'+count + 'count2 value is'+ count2);
       Database.UpsertResult[] upsertt = database.upsert(cc1,false);
         for(Database.UpsertResult sr : upsertt){
            if(sr.isSuccess()){
                system.debug('recordsavedsuccessfully'+sr.getId());
            }
            else {
                for(database.error err : sr.getErrors()){
                    system.debug(err.getstatusCode() + ':' + err.getMessage() );
                    system.debug('account field that affected this error '+err.getFields());
                }
            }
        }
        
    }
}