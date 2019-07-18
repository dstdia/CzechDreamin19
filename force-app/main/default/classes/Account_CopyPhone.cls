public class Account_CopyPhone extends MyTriggers {
    
    public override void onBeforeUpdate(Map<Id,sObject> initialAccountValueMap) {
        // does it make a difference if you do the operation in a before trigger?
        copyPhone((List<Account>)records);
    }
    
    public override void onAfterUpdate(Map<Id,sObject> initialAccountValueMap) {
        // does it make a difference if you do the operation in a after trigger?
        copyPhoneAfter((List<Account>)records);
    }
    
    private void copyPhone(List<Account> accounts) {
        AccountService.copyPhoneToChildContacts(records);
    }
    
    private void copyPhoneAfter(List<Account> accounts) {
        AccountService.copyPhoneToChildContactsAfter(records);
    }
}