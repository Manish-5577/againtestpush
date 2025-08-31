public class updateccount {

    public static void accountestt()
    {
        List<account> acc = [select id,name,phone,rating from account limit 400];
        update acc;
        System.debug('-listCont.size--->'+acc.size());
    }
    public static void insertcontact()
    {
        list<contact> cc = new List<contact>();
        for(integer i =101; i<200;i++){
        contact  ccc = new contact();
        ccc.lastname = 'testname'+i;
            ccc.AccountId ='0015j000012fXpaAAE';
            cc.add(ccc);
            }
        insert cc;
    } 
    
    public static void mergeoperation(){
        List<account> acc = [select id,name,phone from account where id in ('0015j000012fXpaAAE','0015j000012fXstAAE')];
        account master = [select id,name,phone from account where id ='0015j000012fXssAAE'];
        merge master acc;
    }
    
  
    
}