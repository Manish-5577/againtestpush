trigger checklabelandapinamess on Contact (after insert) {
      
    for(contact cc : trigger.new)
    {
        futuremethodcount.future1();
          futuremethodcount.future2();
          futuremethodcount.future3();
          futuremethodcount.future4();
            
    }
}