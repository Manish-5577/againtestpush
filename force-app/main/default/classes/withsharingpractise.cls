public   class withsharingpractise {

    @auraenabled(cacheable=true)
    public static integer contactlistsize()
    {
        return [select id ,name from account].size();
    }
}