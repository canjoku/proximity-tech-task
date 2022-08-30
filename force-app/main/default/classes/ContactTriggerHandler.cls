public with sharing class ContactTriggerHandler extends TriggerHandler  {

    public static void ContactTriggerHandler() {}

    public override void afterInsert() {

        ContactUtility.triggerAction(trigger.new);
    }
   
}