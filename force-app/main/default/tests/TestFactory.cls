@IsTest
@TestVisible
private class TestFactory {
    public static Contact createContactWithAssociatedAccount() {
        Contact cn= new Contact();
        cn.FirstName='Stanley';
        cn.LastName='Edmond';
        cn.Email='HisEmail123@test.com';
        cn.AccountId = createTestAccount().Id;
        return cn;
    }

    public static Contact createTestContact() {
        Contact cn= new Contact();
        cn.FirstName='Patricia';
        cn.LastName='James';
        cn.Email='HerEmail123@test.com';
        return cn;
    }

    public static Account createTestAccount() {
        Account ac = new Account();
        ac.Name='Test Account';
        insert ac;
        return ac;
    }

}
