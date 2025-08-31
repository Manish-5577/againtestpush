trigger opportunitycountbystagename on Opportunity (after insert,after update,after delete,after undelete) {

    

    handlerclassforopporunity.mm(trigger.new, trigger.oldmap);

       
    
    
}