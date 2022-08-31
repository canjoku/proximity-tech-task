@IsTest
private class TestContactTriggerHandler {
    
    @IsTest
    private static void afterInsertExecutesTriggerAction() {
        Test.StartTest();
        TestFactory.createContact();
        Test.StopTest();
    }
}
