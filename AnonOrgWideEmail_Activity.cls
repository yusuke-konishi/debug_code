/* Spring '18, v42.0
SingleEmailMessage Methods | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_email_outbound_single.htm
*/

Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

message.toAddresses = new String[] { 'EMAIL_ADDRESS' };
message.subject = 'Opt Out Test Message';
message.plainTextBody = 'This is the message body.';
message.setOrgWideEmailAddressId('ORG_WIDE_EMAIL_ADDRESS_RECORD_ID'); // set OrgWideEmailAddress to sender address
message.setTargetObjectId('CONTACT_RECORD_ID'); // associate email with contact's activity

Messaging.SingleEmailMessage[] messages = new Messaging.SingleEmailMessage[] {message};
Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

System.debug(results);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: ' + results[0].errors[0].message);
}

/* USER_DEBUG
22:44:06.2 (170213815)|USER_DEBUG|[12]|DEBUG|(Messaging.SendEmailResult[getErrors=();isSuccess=true;])
22:44:06.2 (170363205)|USER_DEBUG|[14]|DEBUG|The email was sent successfully.
*/