trigger MocksTrigger on Mock__c (before insert, after insert) {
	Logger.logTrigger(Trigger.operationType);
    MyTriggers.run();
    Logger.logTrigger(Trigger.operationType);
}