public class wrapperclassaccount {

    
  

    @auraenabled
    public static list<wrapperclassaccount.WrapperClass> fetchAccountContactData(){
        try{
        List<WrapperClass> wrapAccountList = new list<WrapperClass>();
       lead lll = new lead();
            lll.lastname = 'kkdkdd';
            lll.Company = 'cjkjkjdd';
            lll.email = 'sjhsh@kjdkdd.com';
            insert lll;
        for(Account acc : [SELECT Id, Name, (SELECT Id, Name, Email FROM Contacts) FROM Account LIMIT 200]){
            WrapperClass mm = new WrapperClass(acc,acc.Contacts, acc.Contacts.SIZE());
            wrapAccountList.add(mm);
           // wrapAccountList.add(new WrapperClass(acc,acc.Contacts, acc.Contacts.SIZE()));
         
        }
        system.debug('json firmat'+json.serialize(wrapAccountList));
return     wrapAccountList;    
        }
        catch(exception ee)
        {
            throw new aurahandledexception('lalalalalbebebbebebbebeb');
        }
    }
     
    // This wrapper class 
    public class WrapperClass{
      @auraenabled  public Account acc {get; set;}
      @auraenabled    public List<Contact> conList {get; set;}
      @auraenabled    public Integer contactSize{get;set;}
       @auraenabled   public Boolean isCheck{get;set;}
       
      
        public WrapperClass(Account a, List<Contact> cont, Integer countContact) {
            this.acc = a;
            this.conList = cont;
            this.contactSize = countContact;
            this.isCheck = false;
        }
    }
}