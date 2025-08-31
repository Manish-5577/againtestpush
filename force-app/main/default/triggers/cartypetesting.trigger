trigger cartypetesting on Car_Type__c (before update) {

    
    
    for(Car_Type__c cc : trigger.new)
    {
        if(cc.picklisttest__c == 'hot')
        {
            cc.adderror('hureeee erioor');
        }
    }
}