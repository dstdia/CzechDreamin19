public class Invocable_MockMockService {

    @InvocableVariable(
        label='Save the MockMocks?' 
        description='Indicates if the MockMock records should be written to the DB or returned without saving' 
        required=false)
    public boolean doSave;
    
    @InvocableMethod(
        label='create MockMocks' 
        description='Inserts a MockMock__c record for each Mock__c passed into the method.')
    public static List<MockMock__C> createMockMock(List<Mock__c> lMocks) {
        System.debug('Number of Mocks:' + lMocks.size());
    
        List<MockMock__c> newMockMocks = new List<MockMock__c>();
        
    	for (mock__c mock : (List<Mock__c>) lMocks) {
            MockMock__c mockmock = new MockMock__c(
                Name = mock.Name, 
                ParentMock__c = mock.Id);
            newMockMocks.add(mockmock);
        }
        
        //if (doSave == true) {
        	insert newMockMocks;    
        //}
        
        return newMockMocks;
    }
}