@IsTest
private class TestContactTriggerHandler {

    @TestSetup
    static void makeData(){
        Contact testContact = TestFactory.createTestContact();
        Contact testContactWithAccount = TestFactory.createContactWithAssociatedAccount();
        insert testContact;
        insert testContactWithAccount;
        
    }
    
    @IsTest
    private static void afterInsertExecutesTriggerAction() {

        Test.StartTest();
        List<Contact> insertedContacts = [SELECT Id, Name, (Select Id, Status, Priority From Cases) FROM Contact ];
        Test.StopTest();

        System.assertEquals(insertedContacts.size(), 2);
        System.assertEquals(insertedContacts[0].Cases.size(), 1);
        System.assertEquals(insertedContacts[1].Cases.size(), 1);

    }
    @IsTest
    private static void associatedCasesAreCreated() {

        Test.StartTest();
        
        List<Contact> insertedContacts = [SELECT Id, Name, (Select Id, AccountId, ContactId, Status, Priority, Origin From Cases) FROM Contact WHERE FirstName = 'Patricia'];

        List<Contact> insertedContactsWithAccounts = [SELECT Id, Name, (Select Id, AccountId, ContactId, Status, Priority, Origin From Cases) FROM Contact WHERE FirstName = 'Stanley'];

        Test.StopTest();

        System.assertNotEquals(insertedContacts[0].Cases[0].ContactId, null, 'Contact Id on related case should NOT be null');

        System.assertEquals(insertedContacts[0].Cases[0].AccountId,  null, 'Account Id on the related case for this contact should be null');

        System.assertEquals(insertedContacts[0].Cases[0].Status, 'Working');
        System.assertEquals(insertedContacts[0].Cases[0].Priority, 'Medium');
        System.assertEquals(insertedContacts[0].Cases[0].Origin, 'New Contact');


        System.assertNotEquals(insertedContactsWithAccounts[0].Cases[0].ContactId, null, 'Contact Id on related case should not be null');

        System.assertNotEquals(insertedContactsWithAccounts[0].Cases[0].AccountId, null, 'Account Id on related case should not be null');
        
        System.assertEquals(insertedContactsWithAccounts[0].Cases[0].Status, 'Working');
        System.assertEquals(insertedContactsWithAccounts[0].Cases[0].Priority, 'Medium');
        System.assertEquals(insertedContactsWithAccounts[0].Cases[0].Origin, 'New Contact');
        
        
    }

    @IsTest
    private static void associatedTasksAreCreated() {

        Test.StartTest();

        List<Contact> insertedContacts = [SELECT Id, Name, OwnerId, (Select Id, AccountId, ContactId, Status, Priority, Origin, CaseNumber From Cases) FROM Contact WHERE FirstName = 'Patricia'];

        List<Task> insertedTasks = [SELECT Id, Status, Subject, Priority, OwnerId From Task WHERE OwnerId = :insertedContacts[0].OwnerId];

        Test.StopTest();

        System.assertEquals(insertedTasks[0].OwnerId, insertedContacts[0].OwnerId);
        System.assertEquals(insertedTasks[0].Subject, 'Welcome call for ' + insertedContacts[0].Cases[0].CaseNumber);
    }
}
