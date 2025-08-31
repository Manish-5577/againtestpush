trigger usercontactcount on Contact (after insert, after delete, after undelete, after update) {

    
      handlerclasscontact.nn(trigger.new,trigger.oldmap);
}