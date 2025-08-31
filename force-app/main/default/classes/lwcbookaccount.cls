public class lwcbookaccount {
@auraenabled(cacheable =true)
    public static List<account> getaccountforlwc(integer No)
    {
        Integer Nos =  No*15;
        List<account> acc = new List<account>();
        List<account> accc = [select id,name,rating,industry,phone from account order by createddate desc limit : NOs];
        for(integer i = accc.size()-1;i>(accc.size()-15);i--)
        {
                    acc.add(accc[i]);
        }
        return acc;
    }
}