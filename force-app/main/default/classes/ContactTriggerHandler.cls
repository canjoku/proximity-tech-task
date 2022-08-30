public with sharing class ContactTriggerHandler extends TriggerHandler  {

    public static void ContactTriggerHandler() {}

    public override void beforeInsert() {
        CaseUtility.createCase();
    }
   
}