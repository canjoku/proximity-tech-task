public with sharing class CaseUtility {

    public static void createCase() {
        List<Case> newCaseList = new List<Case>();
        Case newCase = new Case();
        newCase.Status = 'Working';
        newCase.Origin = 'New Contact';
        newCaseList.add(newCase);
        insert newCaseList;
    }
}
