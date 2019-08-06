public class Invocable_MockMockCheckService {

    @InvocableMethod(
        label='Checks MockMocks' 
        description='Updates a MockMock__c record with a simple check.')
    public static List<MockMock__C> checkMockMock(List<MockMock__c> lMockMocks) {
        System.debug('Number of Mocks:' + lMockMocks.size());
    
        for (MockMock__c MockMock : (List<MockMock__c>) lMockMocks) {
            MockMock.isChecked__c = true;
        }
        
        update lMockMocks;    
        
        return lMockMocks;
    }
}