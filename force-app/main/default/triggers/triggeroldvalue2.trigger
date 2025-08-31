trigger triggeroldvalue2 on Lead (before insert,before update,after update) {

    
  /*  if(trigger.isbefore && trigger.isupdate)
    {
        for(lead ll : trigger.new)
        {
            ll.email = 'testingnewversion@gmail.com';
        }
    }*/
     if(trigger.isafter && trigger.isupdate)
    {
        for(lead ll : trigger.new)
        {
        //    ll.email = 'testingafterupdatenewversion@gmail.com';
        }
    }
}