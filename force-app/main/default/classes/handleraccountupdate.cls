public class handleraccountupdate {
    
    
    public static void updateaccount(List<account> accc){
        try{
            for(account jk : accc){
                //jk.name = 'testsetuptest';
                system.debug(jk.name);
            }
        }catch(exception ee){
            system.debug(ee.getmessage());
        }
    }
    public static void afterinsertcontact(list<account> acc)
    {  list<contact> cc = new list<contact>();
     try{
         for(account ac1 : acc)
         {
             contact cc1 = new contact(lastname =ac1.name,email='manishaccount@gmail.com',phone='979383243',accountId =ac1.id);
             cc.add(cc1);
         }
         if(cc.size()>0)
         {
             insert cc;
         }}
     catch(exception ee){
         exceptionhandling.handle(ee, 'handleraccountupdate-- method name==>afterinsertcontact');
     }
    }
    
    public static void afterupdatecasefieldonaccoutn(list<account> acc)
    { List<contact> updcc = new list<contact>();
     List<account> acc1 = new List<account>();
     set<id> ss = new set<id>();
     /*    Map<id,account> mapacc = new map<id,account>();
for(account ac1 : acc)
{
mapacc.put(ac1.id,ac1);
}
for(contact cc : [select id,phone,accountid from contact where accountid in : mapacc.keyset()])
{
cc.phone = mapacc.get(cc.accountid).phone;
updcc.add(cc);
}
if(updcc.size()>0)
{
update  updcc;
}*/
     
     /*******************************  Another Approach *****************************************************/
     for(account acc2 : acc)
     {
         ss.add(acc2.id);
     }
     for( account acc3 : [select id,phone,(select id,phone,accountid from contacts )  from account where id in : ss])
     {
         for(contact  cc1 : acc3.contacts){
             cc1.phone =  acc3.phone + '9090';
             updcc.add(cc1);
         }
     }
     if(updcc.size()>0)
     {
         update  updcc;
     }
    }
    public static void updatephone(list<account> acc, map<id,account> oldacc)
    {  set<id> ss = new set<id>();
     for(account gg : acc)
     {
         if(gg.phone != oldacc.get(gg.id).phone)
         {
             ss.add(gg.id);
         }
     }List<contact> upadtedcontact = new list<contact>();
     List<account> ach = [select id,phone,(select id,phone from contacts) from account where id in : ss];
     for(account acd : ach)
     {
         if(acd.contacts.size() > 0)
         {
             for(contact cc : acd.contacts)
             {
                 cc.phone = acd.phone;
                 upadtedcontact.add(cc);
             }
         }
     }
     if(upadtedcontact.size()>0)
     {
         update upadtedcontact;
     }
    }
}