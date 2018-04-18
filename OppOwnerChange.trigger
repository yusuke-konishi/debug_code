/* Spring '18, v42.0
Trigger Context Variables | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_triggers_context_variables.htm

Common Bulk Trigger Idioms | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_triggers_bulk_idioms.htm
*/

trigger OppOwnerTrigger on Opportunity (before update) {
    System.debug('Updating...');

    for (Opportunity newOpp : trigger.new) {
        ID oldOwnerId = trigger.oldMap.get(newOpp.Id).OwnerId;

        User oldOwner = [SELECT Id, Name FROM User WHERE Id = :oldOwnerId];
        System.debug('Old Owner: ' + oldOwner.Name);

        User newOwner = [SELECT Id, Name FROM User WHERE Id = :newOpp.OwnerId];
        System.debug('New Owner: ' + newOwner.Name);

        if (newOpp.OwnerId != oldOwnerId) {
            System.debug('The owner was changed.');
        } else {
            System.debug('The owner was not changed.');
        }
    }
}

/*
(If the owner was changed,)
13:32:57.1 (3917635)|USER_DEBUG|[2]|DEBUG|Updating...
13:32:57.1 (12950176)|USER_DEBUG|[8]|DEBUG|Old Owner: OLD_OWNER
13:32:57.1 (18889584)|USER_DEBUG|[11]|DEBUG|New Owner: NEW_OWNER
13:32:57.1 (18988334)|USER_DEBUG|[14]|DEBUG|The owner was changed.

(If the owner was not changed,)
13:35:34.0 (1924670)|USER_DEBUG|[2]|DEBUG|Updating...
13:35:34.0 (8068665)|USER_DEBUG|[8]|DEBUG|Old Owner: OLD_OWNER
13:35:34.0 (11381209)|USER_DEBUG|[11]|DEBUG|New Owner: OLD_OWNER
13:35:34.0 (11504416)|USER_DEBUG|[16]|DEBUG|The owner was not changed.
*/