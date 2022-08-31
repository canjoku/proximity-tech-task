public with sharing class CaseUtility {

    public static void createCase(Contact cn) {
        Set<String> accountIds = new Set<String>();
        Case newCase = new Case();
        accountIds.add(cn.AccountId);
        List<Account> relatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        List<Case> newCaseList = new List<Case>();

        newCase.Status = 'Working';
        newCase.Origin = 'New Contact';
        if (relatedAccounts.size() > 0) {
            newCase.AccountId = relatedAccounts[0].Id;
        }
        else {
            newCase.ContactId = cn.Id;
            System.debug( 'New case when no account is associated' + newCase);
        }
        switch on cn.ceanff__Level__c{
            when 'Primary' {
                newCase.Priority = 'High';
            }

            when 'Secondary' {
                newCase.Priority = 'Medium';
            }

            when 'Tertiary' {
                newCase.Priority = 'Low';
            }
        }
        newCase.OwnerId = cn.ownerId;
        newCaseList.add(newCase);
        try {
            insert newCaseList;
        } catch (DmlException ex){
            throw ex;
        }
        
        
    }
}
