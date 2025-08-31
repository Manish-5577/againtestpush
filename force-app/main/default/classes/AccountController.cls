public class AccountController {

    
    
    @auraenabled
    public static list<account> lightningdatatable()
    {
        return [select id ,name from account ];
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
      @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
return[SELECT Id, Name, Industry, Phone FROM Account where id ='001J400000TebwUIAR' order by createddate desc  LIMIT 10];
}
     @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts223(){
return[SELECT Id, Name, Industry, Phone FROM Account where id = '001J400000TebwUIAR' order by createddate desc  LIMIT 10];
}
    @auraenabled(cacheable = true)
    public static list<account> getacc(integer mm)
    {
        try{
            return [select id from account limit : mm];
        }
        catch(exception ee){
             throw new  aurahandledexception(ee.getmessage());
        }
    }
    @AuraEnabled
    public static void deleteAccount(String accountId){
    Database.delete(accountId);
}
      @AuraEnabled
    public static void updateAccount(String accountId){
    account upd = new account();
        upd.name = 'update2notifyy' + accountId  ;
        upd.id = accountId;
        update upd;
}
    
    
    @auraenabled
    public static void updaterelatedcontact(string accountid)
    {list<contact> cc1 = new list<contact>();
        for(contact cc : [select id,lastname,accountid from contact where accountid =: accountid])
        {
            cc.lastname =  cc.lastname + cc.accountid;
            cc1.add(cc);
        }
     update cc1;
    }
}