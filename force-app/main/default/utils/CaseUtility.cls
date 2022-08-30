public with sharing class CaseUtility {

    public static void createCase(Contact cn) {
        System.debug(cn);
        Set<String> accountIds = new Set<String>();
        accountIds.add(cn.AccountId);
        List<Account> relatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        List<Case> newCaseList = new List<Case>();
        List<Task> newTaskList = new List<Task>();
        System.debug(relatedAccounts);
        Case newCase = new Case();
        System.debug(newCase);
        newCase.Status = 'Working';
        newCase.Origin = 'New Contact';
        if (relatedAccounts.size() > 0) {
            newCase.AccountId = relatedAccounts[0].Id;
        }
        else {
            newCase.ContactId = cn.Id;
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
        insert newCaseList;
    }
}
