/* Spring '18, v42.0
SingleEmailMessage Methods | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_email_outbound_single.htm
*/

Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

message.toAddresses = new String[] { 'EMAIL_ADDRESS' };
message.subject = 'Opt Out Test Message';
message.plainTextBody = 'This is the message body.';
message.setTargetObjectId('CONTACT_RECORD_ID'); // associate email with contact's activity
message.setWhatId('CASE_RECORD_ID'); // associate email with case's activity

Messaging.SingleEmailMessage[] messages = new Messaging.SingleEmailMessage[] {message};
Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

System.debug(results);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: ' + results[0].errors[0].message);
}

/* USER_DEBUG
08:42:28.2 (96896819)|USER_DEBUG|[12]|DEBUG|(Messaging.SendEmailResult[getErrors=();isSuccess=true;])
08:42:28.2 (97058890)|USER_DEBUG|[14]|DEBUG|The email was sent successfully.
*/