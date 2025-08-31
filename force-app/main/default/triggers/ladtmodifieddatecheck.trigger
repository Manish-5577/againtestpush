trigger ladtmodifieddatecheck on Lead (before update) {

    
    
    for(lead kk : trigger.new)
    {
     /*   Date myDate = kk.LastModifiedDate.date();
Date expected = Date.newInstance(2000,1, 1);
      //  DateTime dt = DateTime.newInstance(2012, 1, 26, 5, 2, 4);
//System.assertEquals(2012, dt.year());
//System.assertEquals(expected, myDate);
        if( myDate.year() == 2000)
        {  kk.adderror('hhhshss');
             kk.company = 'compoany changeeeg';
        }*/
        
    }
}