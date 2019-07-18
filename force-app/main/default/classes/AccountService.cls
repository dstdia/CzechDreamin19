public class AccountService {
    
    public static void copyPhoneToChildContacts (List<Account> records) {
        
        Map<Id, Account> mRecordMap = new Map<Id, Account>(records);
        List<Contact> contacts = [SELECT Id, AccountId, Phone FROM Contact WHERE AccountId IN: mRecordMap.keySet()];
        
        for (Contact c: contacts) {
            c.Phone = mRecordMap.get(c.AccountId).Phone;
        }
        
        update contacts;
    }
    
    public static void copySampleTextToChildContacts (List<Account> records) {
        
        Map<Id, Account> mRecordMap = new Map<Id, Account>(records);
        List<Contact> contacts = [SELECT Id, AccountId, SampleText__c FROM Contact WHERE AccountId IN: mRecordMap.keySet()];
        
        for (Contact c: contacts) {
            c.SampleText__c = mRecordMap.get(c.AccountId).SampleText__c;
        }
        
        update contacts;
    }
    
    public static void copyPhoneToChildContactsAfter (List<Account> records) {
        
        Map<Id, Account> mRecordMap = new Map<Id, Account>(records);
        List<Contact> contacts = [SELECT Id, Account.Phone, Phone FROM Contact WHERE AccountId IN: mRecordMap.keySet()];
        
        for (Contact c: contacts) {
            c.Phone = c.Account.Phone;
        }
        
        update contacts;
    }

}