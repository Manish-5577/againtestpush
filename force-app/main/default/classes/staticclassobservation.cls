public class staticclassobservation {
 
    public integer mm = 9;
    public static integer nn =  9;
    
    public static void staticusecase()
    {
        nn++;
       
    }
    public void nonstaticusecase()
    {
        nn++;
        mm++;
        
    }
    public void finaltesting()
    {
        system.debug('value of mm ..>'+mm);
        system.debug('value of nn ..>'+nn);
    }
}