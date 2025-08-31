global class MyChainedBatch implements Database.Batchable<SObject>, Database.Stateful {

global Integer runCount = 0;
global static final Integer MAX_RUNS = 3;

// Constructor
global MyChainedBatch(Integer count) {
this.runCount = count;
}

global Database.QueryLocator start(Database.BatchableContext bc) {
return Database.getQueryLocator('SELECT Id FROM Opportunity WHERE CreatedDate = LAST_N_DAYS:30');
}

global void execute(Database.BatchableContext bc, List<SObject> scope) {
// Process your logic here
System.debug('Batch run number: ' + runCount);
}

global void finish(Database.BatchableContext bc) {
if (runCount < MAX_RUNS) {
// Chain next batch
System.debug('Chaining next batch. Current count: ' + runCount);
MyChainedBatch nextBatch = new MyChainedBatch(runCount + 1);
Database.executeBatch(nextBatch);
} else {
System.debug('Max batch runs reached. Ending process.');
}
}
}