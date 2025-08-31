trigger leadcount on Lead (after update) {
    system.debug('trigger sieze in after update @@@@@@@@@@==>'+ trigger.size);
}