public with sharing class ContactUtility {
    public static void triggerAction(List<Contact> contactList) {
        for(Contact cn : contactList) {
            CaseUtility.createCase(cn);
            new TaskUtility(cn).execute(null);
        }
    }
}