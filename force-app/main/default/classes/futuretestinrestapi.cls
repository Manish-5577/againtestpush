public class futuretestinrestapi {

  
    public static list<lead> returnleadd(string leadname)
    {
        return [SELECT Id,Name,Email,Phone,Company,MobilePhone from lead where Name like :leadName];
    }
}