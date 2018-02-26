/* Spring '18, v42.0
SingleEmailMessage Methods | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_email_outbound_single.htm
*/

Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

message.toAddresses = new String[] { 'address01@example.com', 'address02@example.com' };
message.subject = 'Opt Out Test Message';
message.plainTextBody = 'This is the message body.';

Messaging.SingleEmailMessage[] messages = new Messaging.SingleEmailMessage[] {message};
Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

System.debug(results);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: ' + results[0].errors[0].message);
}

/* USER_DEBUG
22:40:59.1 (58131916)|USER_DEBUG|[10]|DEBUG|(Messaging.SendEmailResult[getErrors=();isSuccess=true;])
22:40:59.1 (58290317)|USER_DEBUG|[12]|DEBUG|The email was sent successfully.
*/