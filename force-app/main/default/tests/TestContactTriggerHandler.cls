@IsTest
private class TestContactTriggerHandler {
    
    @IsTest
    private static void afterInsertExecutesTriggerAction() {
        Test.StartTest();
        TestFactory.createTestContact();
        Test.StopTest();
    }
    private static void associatesAccountToCase() {
        Test.StartTest();
        TestFactory.createContactWithAssociatedAccount();
        Test.StopTest();
    }
}
