public with sharing class ContactTriggerHandler extends TriggerHandler  {

    public static void ContactTriggerHandler() {}

    public override void beforeInsert() {

        ContactUtility.triggerAction(trigger.new);
    }
   
}