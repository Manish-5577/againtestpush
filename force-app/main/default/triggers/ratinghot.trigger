trigger ratinghot on Account (before update) {

    for(account acc : trigger.new)
    {
        if(acc.rating == 'warm')
        {
          //  acc.adderror('warm not allowed');
        }
    }
}