public with sharing class CaseUtility {

    public static void createCase(Contact cn) {
        Set<String> accountIds = new Set<String>();
        Case newCase = new Case();
        accountIds.add(cn.AccountId);
        List<Account> relatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        List<Case> newCaseList = new List<Case>();

        System.debug(relatedAccounts);

        newCase.Status = 'Working';
        newCase.Origin = 'New Contact';

        newCase.ContactId = cn.Id;

        if (relatedAccounts.size() > 0) {
            newCase.AccountId = relatedAccounts[0].Id;
        }

        System.debug(newCase);

       
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
        
        insert newCaseList;
        
        
    }
}
