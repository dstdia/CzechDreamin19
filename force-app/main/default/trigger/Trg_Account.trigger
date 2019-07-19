trigger Trg_Account on Account (before update, after update) {


    // executing trigger framework
    //Logger.logTrigger(Trigger.operationType, 'Trg_Account');
    Logger.push();
    MyTriggers.run();
    Logger.pop();
    //Logger.logTrigger(Trigger.operationType, 'Trg_Account');

    /*
     * "Traditional Style Trigger - Minimum Overhead"
       switch on Trigger.OperationType {

            when BEFORE_UPDATE {

        // Copying a field with System Validations to related objects
                AccountService.copyPhoneToChildContacts(Trigger.new);
                // Copying a field without System Validations to related objects
                //AccountService.copySampleTextToChildContacts(Trigger.new);
            }
        }*/
}