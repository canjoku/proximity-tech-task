@IsTest
@TestVisible
private class TestFactory {
    public static void createContactRecordWithAssociatedAccount() {
        Contact cn= new Contact();
        cn.FirstName='Stanley';
        cn.LastName='Edmond';
        cn.Email='HisEmail123@test.com';
        cn.AccountId = createAccount().Id;
        insert cn;  
    }

    public static void createContact() {
        Contact cn= new Contact();
        cn.FirstName='Patricia';
        cn.LastName='James';
        cn.Email='HerEmail123@test.com';
        insert cn;  
    }

    public static Account createAccount() {
        Account ac = new Account();
        ac.Name='Test Account';
        insert ac;
        return ac;
    }

    // public static createCaseRecord() {
    //     Case cs = new Case();
    //     newCase.Status = 'Working';
    //     newCase.Origin = 'New Contact';
    //     insert cs;
    // }
    // public static createTaskRecord() {
    //     Task tk = new Task();
    //     tk.Status = 'Not Started';
    //     tk.Priority = 'Normal';
    //     tk.ActivityDate = Date.today();
    // }

}
