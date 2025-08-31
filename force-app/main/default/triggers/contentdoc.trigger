trigger contentdoc on ContentDocument (before insert) {

    
    for(ContentDocument cc : trigger.new)
    {
      //  cc.adderror('blalallallallala');
    }
}